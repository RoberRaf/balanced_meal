import 'package:flutterflow_task/core/services/network/api_client.dart';
import 'package:flutterflow_task/core/services/network/error_model.dart';
import 'package:flutterflow_task/features/create_order/data/product_model.dart';

class ProductsRepo {
  static Future<(List<ProductModel>?, ErrorModel?)> getProducts(String endpoint) async {
    final resp = await ApiClient().get(endpoint: endpoint);
    if (resp.error == null) {
      print('resp.response.data: ${resp.response.data}');
      final products = <ProductModel>[];
      for (final item in resp.response.data) {
        products.add(ProductModel.fromJson(item));
      }
      return (products, null);
    }
    return (null, resp.error);
  }
}
