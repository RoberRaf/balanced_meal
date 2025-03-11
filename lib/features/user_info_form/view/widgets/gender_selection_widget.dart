import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/core/extensions/enums.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key, required this.onSelected});
  final Function(Gender? v) onSelected;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: AppConsts.defaultRadius,
      borderSide: BorderSide(color: Colors.black12),
    );
    return DropdownMenu<Gender?>(
      initialSelection: null,
      menuStyle: MenuStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(4)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius)),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        surfaceTintColor: WidgetStatePropertyAll(Colors.white),
      ),
      hintText: 'Choose Your Gender',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: border,
        enabledBorder: border,
      ),
      width: MediaQuery.sizeOf(context).width - 48,
      onSelected: onSelected,
      dropdownMenuEntries: List.generate(
        Gender.values.length,
        (index) {
          return DropdownMenuEntry(
            value: Gender.values[index],
            label: Gender.values[index].name,
            trailingIcon: Icon(Icons.check),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
              ),
              iconColor: WidgetStateProperty.fromMap(
                {
                  WidgetState.focused: Colors.orange,
                  WidgetState.any: Colors.transparent,
                },
              ),
              backgroundColor: WidgetStateProperty.fromMap(
                {
                  WidgetState.focused: Colors.orange.withAlpha(50),
                  WidgetState.any: Colors.white,
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
