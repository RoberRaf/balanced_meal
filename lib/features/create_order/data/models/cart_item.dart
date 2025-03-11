import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';

class CartItem extends ProductModel {
  late int quantity;
  CartItem({
    required super.id,
    super.foodName,
    super.calories,
    super.image,
    super.price,
    this.quantity = 1,
  });

  CartItem.fromProduct(ProductModel product)
      : super(
          id: product.id,
          foodName: product.foodName,
          calories: product.calories,
          image: product.image,
          price: product.price,
        ) {
    quantity = 1;
  }

  int totalCalories() => (calories ?? 0) * quantity;
  double totalPrice() => (price ?? 0) * quantity;
}
