import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/features/create_order/data/product_model.dart';
import 'package:flutterflow_task/features/general_widgets/add_increment_switcher.dart';
import 'package:flutterflow_task/features/general_widgets/custom_network_image.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
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
                        Text('\$${product.price}', style: TStyle.blackSemi(18)),
                        AddIncrementSwitcher(
                          quantity: 2,
                          isExists: false,
                          onIncrement: () {
                            return true;
                          },
                          onDecrement: () {
                            return true;
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
