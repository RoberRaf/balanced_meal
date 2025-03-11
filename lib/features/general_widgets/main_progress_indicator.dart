import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';

class MainProgressIndicator extends StatelessWidget {
  const MainProgressIndicator({super.key, this.topPadding});
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 20),
      child: Center(
        child: const AdaptiveProgressIndicator(),
      ),
    );
  }
}

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({super.key, this.color, this.radius});
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SizedBox(
            height: (radius ?? 24) * 2,
            width: (radius ?? 24) * 2,
            child: CircularProgressIndicator(
              color: color ?? Co.primary,
            ),
          )
        : CupertinoActivityIndicator(
            color: color ?? Co.primary,
            radius: radius ?? 24,
          );
  }
}
