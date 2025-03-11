import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/core/services/network/error_model.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, required this.error, required this.onRetry, this.btnPad});
  final ErrorModel error;
  final Function() onRetry;
  final EdgeInsets? btnPad;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error.message ?? error.errors?.join('\n') ?? '', style: TStyle.whiteBold(16).copyWith(color: Co.red)),
          const VerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainButton(
                text: "Try again",
                padding: btnPad ?? EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                bgColor: Co.redWithOp,
                style: TStyle.whiteSemi(15).copyWith(color: Co.red),
                ontap: onRetry,
              ),
            ],
          )
        ],
      ),
    );
  }
}
