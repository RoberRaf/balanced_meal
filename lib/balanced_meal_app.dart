import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/features/home/home_screen.dart';

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: "Task App",
        theme: MyTheme.mainTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppConsts.navigatorKey,
        home: const HomeScreen(),
      ),
    );
  }
}
