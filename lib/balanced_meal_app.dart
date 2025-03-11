import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/features/home/home_screen.dart';

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SharedPreferences.getInstance().then((value) {
    //   value.clear();
    // });
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: "Task App",
        theme: MyTheme.mainTheme,
        navigatorObservers: [AppConsts.routeObserver],
        themeMode: ThemeMode.light, // context.read<SettingsCubit>().isLight ? ThemeMode.light : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        // initialRoute: Routes.splashScreen,
        // home: const SplashScreen(),
        navigatorKey: AppConsts.navigatorKey,
        // onGenerateRoute: RouteGenerator.onGenerateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
