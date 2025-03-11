import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/core/resources/fakers.dart';
import 'package:flutterflow_task/features/create_order/cubit/products_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubit/products_states.dart';
import 'package:flutterflow_task/features/create_order/view/widgets/category_widget.dart';
import 'package:flutterflow_task/features/general_widgets/failed_widget.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  late final ProductsCubit productsCubit;
  @override
  void initState() {
    productsCubit = context.read<ProductsCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsCubit.getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Order'),
        // titleTextStyle: TStyle.blackSemi(22),
        automaticallyImplyLeading: true,
        foregroundColor: Co.black,
      ),
      body: SafeArea(child: BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state is ProductsFailureState) {
          return FailedWidget(
              error: state.error,
              onRetry: () {
                productsCubit.getAllProducts();
              });
        }
        final isLoading = state is ProductsLoadingState;
        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CategoryWidget(
                      catName: 'Vegetables',
                      products: (!isLoading && state is ProductsSuccessState ? state.vegetables : Fakers.fakeProducts),
                    ),
                    VerticalSpacing(24),
                    CategoryWidget(
                      catName: 'Meat',
                      products: (!isLoading && state is ProductsSuccessState ? state.meat : Fakers.fakeProducts),
                    ),
                    VerticalSpacing(24),
                    CategoryWidget(
                      catName: 'Carbs',
                      products: (!isLoading && state is ProductsSuccessState ? state.carbs : Fakers.fakeProducts),
                    ),
                  ],
                ),
              ),
              MainButton(
                text: 'Next',
                margin: AppConsts.defaultHorPadding,
                ontap: () {},
              ),
            ],
          ),
        );
      })),
    );
  }
}
