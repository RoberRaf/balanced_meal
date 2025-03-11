import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/session_data.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/core/extensions/context.dart';
import 'package:flutterflow_task/core/services/helpers.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_states.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/order_summary/view/order_summary_screen.dart';

class OrderFooterWidget extends StatefulWidget {
  const OrderFooterWidget({super.key});

  @override
  State<OrderFooterWidget> createState() => _OrderFooterWidgetState();
}

class _OrderFooterWidgetState extends State<OrderFooterWidget> {
  final calReference = SessionData.inst.userInfo.calculateCalorites();
  late final OrderCubit cubit;

  @override
  void initState() {
    cubit = context.read<OrderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Co.background, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(0, -5),
        ),
      ]),
      child: Padding(
        padding: AppConsts.defaultPadding,
        child: Column(
          spacing: 12,
          children: [
            LayoutBuilder(
              builder: (context, constraints) => BlocBuilder<OrderCubit, OrderStates>(
                  buildWhen: (previous, current) => current is ColorUpdatedState,
                  builder: (context, state) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Co.lightgrey, borderRadius: AppConsts.defaultRadius),
                      height: 8,
                      width: constraints.maxWidth,
                      child: Row(
                        children: [
                          AnimatedContainer(
                            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                            duration: Durations.medium4,
                            height: 8,
                            width: cubit.selectedCalRatio() * constraints.maxWidth,
                            color: state is ColorUpdatedState ? state.color : Colors.grey,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cals',
                  style: TStyle.blackRegular(20),
                ),
                BlocBuilder<OrderCubit, OrderStates>(
                    buildWhen: (previous, current) => current is CaloriesUpdatedState,
                    builder: (context, state) {
                      final cal = state is CaloriesUpdatedState ? state.calories : 0;
                      return AnimatedSwitcher(
                        duration: Durations.medium4,
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                        child: Text(
                          key: ValueKey(cal),
                          "$cal Cal out of $calReference",
                          style: TStyle.greyRegular(18),
                        ),
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TStyle.blackRegular(20),
                ),
                BlocBuilder<OrderCubit, OrderStates>(
                    buildWhen: (previous, current) => current is PriceUpdatedState,
                    builder: (context, state) {
                      final price = state is PriceUpdatedState ? state.price : 0;
                      return AnimatedSwitcher(
                        duration: Durations.medium4,
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                        child: Text(
                          key: ValueKey(price),
                          Helpers.getProperPrice(price),
                          style: TStyle.primaryBold(20),
                        ),
                      );
                    }),
              ],
            ),
            BlocBuilder<OrderCubit, OrderStates>(
                buildWhen: (previous, current) => current is ColorUpdatedState,
                builder: (context, state) {
                  return MainButton(
                    text: 'Place Order',
                    enable: state is ColorUpdatedState ? state.color == Colors.green : false,
                    ontap: () {
                      context.myPush(BlocProvider.value(value: cubit, child: OrderSummaryScreen()));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
