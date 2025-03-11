import 'package:flutter/material.dart';

abstract class AppConsts {

  // static const double defaultBorderRadius = 10;
  static BorderRadius defaultRadius = BorderRadius.circular(12);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final defaultPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 8);
  static final defaultHomePadding = EdgeInsets.fromLTRB(24, 8, 24, 95);
  static final defaultHorPadding = EdgeInsets.symmetric(horizontal: 24);


}
