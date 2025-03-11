import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.style,
      this.borderRadius,
      this.bgColor = Co.primary,
      this.borderColor,
      this.showBorder = false,
      this.isLoading = false,
      this.enable = true,
      this.padding,
      this.margin = EdgeInsets.zero,
      this.height,
      this.width,
      this.child,
      this.icon,
      this.disabledBGColor = Colors.grey
      // this.dontGiveMinWidth,
      });
  final String text;
  final Function() ontap;
  final TextStyle? style;
  final double? borderRadius;
  final Color bgColor;
  final Color disabledBGColor;
  final Color? borderColor;
  final bool showBorder;
  final bool isLoading;
  final bool enable;
  final EdgeInsets? padding;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final Widget? child;
  final dynamic icon;
  // final bool? dontGiveMinWidth;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator(
                    color: bgColor,
                  )
                : CupertinoActivityIndicator(
                    color: bgColor,
                  ),
          )
        : Padding(
            padding: margin,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  color: !enable ? disabledBGColor : bgColor,
                ),
                child: MaterialButton(
                  minWidth: width ?? (padding != null ? null : width ?? double.infinity),
                  onPressed: enable ? ontap : null,
                  height: height ?? (padding == null ? height : 0),
                  padding: padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    side: showBorder ? BorderSide(color: borderColor ?? style?.color ?? Co.primary) : BorderSide.none,
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  ),
                  child: child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null && icon is IconData)
                            Icon(
                              icon,
                              color: style?.color ?? Co.white,
                              size: 22,
                            ),
                          if (icon != null && icon is String)
                            SvgPicture.asset(
                              icon,
                              width: 22,
                              height: 22,
                              colorFilter: ColorFilter.mode(style?.color ?? Co.white, BlendMode.srcIn),
                            ),
                          const HorizontalSpacing(12),
                          Text(text, style: style ?? TStyle.whiteBold(15), overflow: TextOverflow.ellipsis),
                          const HorizontalSpacing(12),
                        ],
                      ),
                )),
          );
  }
}
