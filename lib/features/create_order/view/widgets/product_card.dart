import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/core/extensions/irretable.dart';
import 'package:flutterflow_task/core/services/helpers.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_states.dart';
import 'package:flutterflow_task/features/create_order/data/models/cart_item.dart';
import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';
import 'package:flutterflow_task/features/general_widgets/add_increment_switcher.dart';
import 'package:flutterflow_task/features/general_widgets/custom_network_image.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    return SizedBox(
      width: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppConsts.defaultRadius,
          color: Co.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: CustomNetworkImage(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  isInsta: true,
                  width: 180,
                ),
              ),
              VerticalSpacing(10),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            product.foodName ?? '',
                            style: TStyle.blackBold(18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("${product.calories} cal", style: TStyle.greySemi(15)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Helpers.getProperPrice(product.price ?? 0), style: TStyle.blackSemi(18)),
                        BlocBuilder<OrderCubit, OrderStates>(
                          buildWhen: (previous, current) {
                            if (current is UpdateItemState && current.id == product.id) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            final item = cubit.cartItems.firstWhereOrNull((e) => e.id == product.id);
                            return AddIncrementSwitcher(
                              quantity: item?.quantity ?? 0,
                              isExists: item != null,
                              onIncrement: () {
                                if (item == null) {
                                  cubit.addCartItem(CartItem.fromProduct(product));
                                  return true;
                                }
                                return cubit.itemQtyChange(product.id, true);
                              },
                              onDecrement: () {
                                return cubit.itemQtyChange(product.id, false);
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
