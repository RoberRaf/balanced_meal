import 'package:flutterflow_task/core/services/network/api_client.dart';
import 'package:flutterflow_task/core/services/network/endpoints.dart';
import 'package:flutterflow_task/features/create_order/data/models/order_request.dart';

class OrderRepo {
  OrderRepo._();

  static Future<bool> createOrder(OrderRequest req) async {
    ApiClient().switchDomain(true);
    final resp = await ApiClient().post(endpoint: Endpoints.createOrder, requestBody: req.toJson());
    ApiClient().switchDomain(false);

    if (resp.error == null) {
      return true;
    }
    return false;
  }
}
