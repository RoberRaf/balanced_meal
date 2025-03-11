import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/core/services/helpers.dart';
import 'package:flutterflow_task/features/create_order/data/models/cart_item.dart';
import 'package:flutterflow_task/features/general_widgets/custom_network_image.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key, required this.item});
  final CartItem item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppConsts.defaultRadius,
          color: Co.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            spacing: 10,
            children: [
              CustomNetworkImage(
                item.image ?? '',
                height: 64,
                width: 72,
                borderReduis: 6,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.foodName ?? '', style: TStyle.blackSemi(16)),
                        Text(Helpers.getProperPrice(item.totalPrice()), style: TStyle.blackBold(16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cal ${item.totalCalories()}", style: TStyle.greySemi(14)),
                        Text("Qty: ${item.quantity}", style: TStyle.primaryRegular(16)),
                      ],
                    ),
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
