import 'package:flutterflow_task/core/services/network/error_model.dart';
import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';

abstract class ProductsState {}

class ProductInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> vegetables;
  final List<ProductModel> carbs;
  final List<ProductModel> meat;

  ProductsSuccessState({
    required this.vegetables,
    required this.carbs,
    required this.meat,
  });
}

class ProductsFailureState extends ProductsState {
  final ErrorModel error;

  ProductsFailureState(this.error);
}
