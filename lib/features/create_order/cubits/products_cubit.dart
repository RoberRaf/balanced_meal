import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/core/services/network/endpoints.dart';
import 'package:flutterflow_task/core/services/network/error_model.dart';
import 'package:flutterflow_task/features/create_order/cubits/products_states.dart';
import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';
import 'package:flutterflow_task/features/create_order/data/repo/products_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductInitialState());

  getAllProducts() async {
    emit(ProductsLoadingState());
    final response = await Future.wait([
      _getVegetables(),
      _getCarbs(),
      _getMeat(),
    ]);
    if (response.any((e) => e.$2 != null)) {
      emit(ProductsFailureState(response.firstWhere((e) => e.$2 != null).$2!));
    } else {
      emit(ProductsSuccessState(
        vegetables: response[0].$1 ?? [],
        carbs: response[1].$1 ?? [],
        meat: response[2].$1 ?? [],
      ));
    }
  }

  Future<(List<ProductModel>?, ErrorModel?)> _getVegetables() async {
    return await ProductsRepo.getProducts(Endpoints.vegetables);
  }

  Future<(List<ProductModel>?, ErrorModel?)> _getCarbs() async {
    return await ProductsRepo.getProducts(Endpoints.carbs);
  }

  Future<(List<ProductModel>?, ErrorModel?)> _getMeat() async {
    return await ProductsRepo.getProducts(Endpoints.meat);
  }
}
