import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';

class AddIncrementSwitcher extends StatelessWidget {
  const AddIncrementSwitcher({
    super.key,
    required this.isExists,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.alignment = Alignment.center,
  });
  final bool isExists;
  final int quantity;
  final bool Function() onIncrement;
  final bool Function() onDecrement;

  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 95, minHeight: 40),
        child: Align(
          alignment: alignment,
          child: AnimatedSwitcher(
            duration: Durations.short2,
            // layoutBuilder: (currentChild, previousChildren) {
            //   return Stack(
            //     alignment: AlignmentDirectional.center,
            //     children: <Widget>[
            //       ...previousChildren,
            //       if (currentChild != null) currentChild,
            //     ],
            //   );
            // },
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: !isExists
                ? MainButton(
                    text: 'Add',
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    borderRadius: 15,
                    width: 0,
                    ontap: () {
                      onIncrement();
                    },
                  )
                : IncrementWidget(
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                    quantity: quantity,
                  ),
          ),
        ));
  }
}

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.quantity,
    this.isHorizontal = true,
  });
  final bool Function() onIncrement;
  final bool Function() onDecrement;
  final int quantity;

  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            onDecrement();
          },
          constraints: BoxConstraints(),
          padding: EdgeInsets.all(6),
          icon: const Icon(
            Icons.remove_circle,
            color: Co.primary,
            size: 24,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 20),
          child: AnimatedSwitcher(
            duration: Durations.medium1,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                // position: Tween<Offset>(begin: const Offset(0.0, -0.5), end: const Offset(0.0, 0.0)).animate(animation),
                child: child,
              );
            },
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: TStyle.blackBold(15),
              key: ValueKey(quantity),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            onIncrement();
          },
          constraints: BoxConstraints(),
          padding: EdgeInsets.all(6),
          icon: const Icon(
            Icons.add_circle,
            color: Co.primary,
            size: 24,
          ),
        ),
      ],
    );
  }
}
