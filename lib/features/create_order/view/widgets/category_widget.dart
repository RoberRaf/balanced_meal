import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';
import 'package:flutterflow_task/features/create_order/view/widgets/product_card.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.catName, required this.products});
  final String catName;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppConsts.defaultHorPadding,
          child: Text(
            catName,
            style: TStyle.blackSemi(22),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            padding: AppConsts.defaultPadding,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const HorizontalSpacing(16),
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductCard(product: item);
            },
          ),
        ),
      ],
    );
  }
}
