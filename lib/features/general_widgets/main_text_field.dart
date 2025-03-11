import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/features/general_widgets/main_progress_indicator.dart';

export 'package:flutter/services.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.isLoading = false,
    this.hintText,
    this.label,
    this.style,
    this.onChange,
    this.onSubmitting,
    this.validator,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.hieght,
    this.width,
    this.isPassword = false,
    this.borderRadius,
    this.borderColor,
    this.foucusedColor,
    this.bgColor,
    this.isFilled = true,
    this.showBorder = true,
    this.inputFormatters,
    this.padding,
    this.iconsConstraints,
    this.showShadow = false,
    this.maxLines,
    this.prefixOnTap,
    this.isUnderlinedBorder = false,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextStyle? style;
  final bool enabled;
  final bool isLoading;
  final Function(String)? onChange;
  final Function(String?)? onSubmitting;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final double? hieght;
  final double? width;
  final double? borderRadius;
  final Color? borderColor;
  final Color? foucusedColor;
  final bool isPassword;
  final bool isFilled;
  final bool showBorder;
  final Color? bgColor;
  final TextInputFormatter? inputFormatters;
  final EdgeInsets? padding;
  final BoxConstraints? iconsConstraints;
  final bool showShadow;
  final int? maxLines;
  final VoidCallback? prefixOnTap;
  final bool isUnderlinedBorder;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late final ValueNotifier<bool> isObscure;
  late final InputBorder focusedBorder;
  late final InputBorder errorBorder;
  late final InputBorder focusedErrorBorder;
  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.isPassword);
    if (widget.isUnderlinedBorder) {
      focusedBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular((widget.borderRadius ?? 12)),
        borderSide: BorderSide(
          color: widget.borderColor ?? Colors.black12,
          width: 0.75,
        ),
      );
      errorBorder = focusedBorder.copyWith(
        borderSide: BorderSide(color: !widget.showBorder ? Colors.transparent : Colors.red, width: 0.75),
      );
      focusedErrorBorder = focusedBorder.copyWith(
        borderSide: BorderSide(
          color: !widget.showBorder ? Colors.transparent : widget.borderColor ?? Colors.black12,
          width: 0.75,
        ),
      );
    } else {
      focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular((widget.borderRadius ?? 12)),
        borderSide: BorderSide(
          color: widget.borderColor ?? Colors.black12,
          width: 0.75,
        ),
      );
      errorBorder = focusedBorder.copyWith(
        borderSide: BorderSide(
          color: !widget.showBorder ? Colors.transparent : Colors.red,
          width: 0.75,
        ),
      );
      focusedErrorBorder = focusedBorder.copyWith(
        borderSide: BorderSide(
          color: !widget.showBorder ? Colors.transparent : widget.borderColor ?? Colors.black12,
          width: 0.75,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final iconContraints = widget.iconsConstraints ?? BoxConstraints(minHeight: 25, maxHeight: 40, maxWidth: 40, minWidth: 25);
    return widget.isLoading
        ? SizedBox(height: (widget.hieght ?? 50), child: const MainProgressIndicator())
        : ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              return TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                maxLines: widget.maxLines ?? 1,
                cursorColor: Co.primary,
                controller: widget.controller,
                enabled: widget.enabled,
                style: widget.style ??
                    (!widget.enabled
                        ? TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey)
                        : TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54)),
                validator: widget.validator,
                onChanged: widget.onChange,
                onSaved: widget.onSubmitting,
                obscureText: value,
                inputFormatters: widget.inputFormatters != null ? [widget.inputFormatters!] : null,
                keyboardType:
                    widget.inputFormatters == FilteringTextInputFormatter.digitsOnly ? TextInputType.number : null,
                decoration: InputDecoration(
                  // errorStyle: TextStyle(color: Colors.red, fontSize: 13),
                  hintText: widget.hintText,
                  hintStyle: widget.style ?? TStyle.whiteRegular(16).copyWith(color: Colors.black54),
                  labelText: widget.label,
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  prefixIcon: widget.prefix == null
                      ? null
                      : widget.prefixOnTap == null
                          ? Padding(
                              padding: EdgeInsets.all(5
                                  // right: context.read<SettingsCubit>().isEn ? 5 : 0,
                                  // left: context.read<SettingsCubit>().isEn ? 0 : 5,
                                  ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Co.primary, borderRadius: AppConsts.defaultRadius),
                                child: Padding(padding: EdgeInsets.all(8), child: widget.prefix),
                              ),
                            )
                          : MaterialButton(
                              minWidth: 20,
                              onPressed: widget.prefixOnTap ?? () {},
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
                              color: Co.primary,
                              child: widget.prefix),

                  suffixIcon: widget.suffixWidget,
                  suffixIconConstraints: BoxConstraints(minHeight: 25, maxHeight: 40, maxWidth: 40, minWidth: 40),

                  filled: widget.isFilled || widget.bgColor != null,

                  fillColor: widget.bgColor ?? Colors.white,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                  enabledBorder: focusedBorder,
                  disabledBorder: focusedBorder.copyWith(borderSide: BorderSide(color: Colors.grey, width: 1)),
                ),
              );
            },
          );
  }

  Widget? getSiffixIcon(value) {
    if (widget.suffix != null) return widget.suffix;
    if (widget.isPassword) {
      return InkWell(
        onTap: () => isObscure.value = !value,
        child: Icon(
          value ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
          color: Colors.black45,
          size: 20,
        ),
      );
    }
    return null;
  }
}
