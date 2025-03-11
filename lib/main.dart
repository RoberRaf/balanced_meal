import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/balanced_meal_app.dart';
import 'package:flutterflow_task/core/cubits/bloc_observer.dart';
import 'package:flutterflow_task/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(const BalancedMealApp());
}
