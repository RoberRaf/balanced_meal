import 'package:flutterflow_task/features/create_order/data/models/cart_item.dart';

class OrderRequest {
  List<CartItem> cartItems;

  OrderRequest({
    required this.cartItems,
  });

  Map<String, dynamic> toJson() {
    final orderitems = cartItems
        .map((e) => OrderItem(name: e.foodName ?? '', totalPrice: e.totalPrice(), quantity: e.quantity))
        .toList();
    return {
      'items': orderitems.map((e) => e.toMap()).toList(),
    };
  }
}

class OrderItem {
  String? name;
  final double totalPrice;
  final int quantity;

  OrderItem({
    required this.name,
    required this.totalPrice,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'total_price': totalPrice,
      'quantity': quantity,
    };
  }
}
