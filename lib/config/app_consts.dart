import 'package:flutter/material.dart';

abstract class AppConsts {
  static const fileSizeInBytes = 2097152;
  static const trackingInterval = 30;
  static const hotLine = 16194;
  static const maxWidth = 512.0;
  static const widthOnWideScreens = 650.0;

  // static const double defaultBorderRadius = 10;
  static BorderRadius defaultRadius = BorderRadius.circular(12);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static List<BoxShadow> boxSahdow({double? opacity, Color? color, Offset? offset}) => [
        BoxShadow(
          color: (color ?? Colors.black).withAlpha((opacity ?? 0.1 * 255).toInt()),
          blurRadius: 4,
          spreadRadius: 4,
          offset: offset ?? const Offset(0, 0),
        )
      ];

  static final defaultPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 8);
  static final defaultHomePadding = EdgeInsets.fromLTRB(24, 8, 24, 95);
  static final defaultHorPadding = EdgeInsets.symmetric(horizontal: 24);

  static BoxDecoration get checkoutDecoration => BoxDecoration(
        borderRadius: AppConsts.defaultRadius,
        border: Border.all(color: Colors.black38, width: 1),
      );

  static const checkoutTitleSize = 15.0;

  static final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
}
