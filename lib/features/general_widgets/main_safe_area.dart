import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';

class MainSafeArea extends StatelessWidget {
  final Widget child;
  final Color? topColor;
  final Color? bottomColor;
  const MainSafeArea({super.key, required this.child, this.topColor, this.bottomColor});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: topColor ?? Co.white,
      child: SafeArea(
        bottom: false,
        child: ColoredBox(
          color: bottomColor ?? Co.white,
          child: SafeArea(
            child: child,
          ),
        ),
      ),
    );
  }
}
