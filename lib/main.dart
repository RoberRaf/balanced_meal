import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/core/cubits/bloc_observer.dart';
import 'package:flutterflow_task/core/services/helpers.dart';
import 'package:flutterflow_task/di.dart';
import 'package:flutterflow_task/balanced_meal_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  try {
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    ///
  }
  await Helpers.customTryCatch(init);
  // await Helpers.customTryCatch(di.getAsync<PackageInfo>);
  // await di<LocalNotificationServices>().init();
  runApp(const BalancedMealApp());
}
