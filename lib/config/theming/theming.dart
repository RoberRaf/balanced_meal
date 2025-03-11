import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';

export 'package:flutterflow_task/config/app_consts.dart';
export 'package:flutterflow_task/config/theming/app_colors.dart';
export 'package:flutterflow_task/config/theming/text_styles.dart';

class MyTheme {
  static ThemeData get mainTheme => ThemeData(
        dialogBackgroundColor: Co.background,
        fontFamily: 'cairo',
        scaffoldBackgroundColor: Co.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.transparent,
        ),
        dividerColor: Colors.black26,
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
          position: PopupMenuPosition.under,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
        ),
        cardColor: Colors.white,
        splashColor: Colors.grey,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Co.background,
        ),
        highlightColor: Colors.black12,
        disabledColor: Colors.grey,
        canvasColor: Colors.white,
        shadowColor: Colors.black12,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.blueGrey),
        )),
        listTileTheme: ListTileThemeData(
          selectedColor: Colors.white,
          dense: true,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: AppConsts.defaultRadius,
            side: BorderSide(color: Colors.grey.withAlpha(52), width: 1),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            menuStyle: MenuStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                backgroundColor: WidgetStatePropertyAll(Co.background))),
        dialogTheme: DialogTheme(
            backgroundColor: Co.background,
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        radioTheme: const RadioThemeData(fillColor: WidgetStatePropertyAll(Co.primary)),
      );
}
