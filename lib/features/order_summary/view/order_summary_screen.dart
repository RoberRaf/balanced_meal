import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/session_data.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/core/extensions/context.dart';
import 'package:flutterflow_task/core/helpers/alerts.dart';
import 'package:flutterflow_task/core/services/helpers.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_states.dart';
import 'package:flutterflow_task/features/create_order/data/models/cart_item.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';
import 'package:flutterflow_task/features/order_summary/view/widgets/product_horizontal_card.dart';
import 'package:flutterflow_task/features/user_info_form/data/user_info_model.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  late final List<CartItem> cartItems;
  late final OrderCubit cubit;

  @override
  void initState() {
    cubit = context.read<OrderCubit>();
    cartItems = cubit.cartItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
        automaticallyImplyLeading: true,
        foregroundColor: Co.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: AppConsts.defaultPadding,
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => VerticalSpacing(12),
                itemBuilder: (context, index) {
                  return ProductHorizontalCard(item: cartItems[index]);
                },
              ),
            ),
            DecoratedBox(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cals', style: TStyle.blackRegular(20)),
                        Text(
                          '${cubit.calculateTotalCalories()}',
                          style: TStyle.greyRegular(18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TStyle.blackRegular(20),
                        ),
                        Text(
                          Helpers.getProperPrice(cubit.calculateTotalPrice()),
                          style: TStyle.primaryBold(20),
                        ),
                      ],
                    ),
                    BlocConsumer<OrderCubit, OrderStates>(
                      listener: (context, state) {
                        if (state is OrderCreateSuccessState) {
                          Alerts.showToast("Order Created Successfully", error: false);
                          SessionData.inst.userInfo = UserInfoModel();
                          context.myPopUntilFirstScreen();
                          cubit.close();
                        } else if (state is OrderCreateFailureState) {
                          Alerts.showToast(state.error);
                        }
                      },
                      builder: (context, state) => MainButton(
                        text: 'Place Order',
                        isLoading: state is OrderCreateLoadingState,
                        ontap: () {
                          cubit.craeteOrder();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
