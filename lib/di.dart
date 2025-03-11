import 'package:flutterflow_task/core/services/network/api_client.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubits/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future init() async {
  di.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

  di.registerLazySingleton<ApiClient>(() => ApiClient());

  await di.getAsync<SharedPreferences>();
  // Cubits
  di.registerFactory<ProductsCubit>(() => ProductsCubit());
  di.registerFactory<OrderCubit>(() => OrderCubit());
}
