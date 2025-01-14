import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class CustomStateButton extends StatelessWidget {
  const CustomStateButton({
    super.key,
    required this.onPressed,
    required this.currentState,
    required this.label,
    this.width = double.infinity,
    this.loadingWidth = double.infinity,
    this.height = 44,
  });
  final String label;
  final Function? onPressed;
  final ButtonState currentState;
  final double width;
  final double loadingWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ProgressButton(
      radius: 10,
      minWidth: double.infinity,
      maxWidth: double.infinity,
      height: 44,
      progressIndicatorAlignment: MainAxisAlignment.center,
      stateWidgets: {
        ButtonState.idle: Text(
          label,
          style: StyleManager.fontMedium14,
        ),
        ButtonState.loading: const SizedBox(),
        ButtonState.fail: Text(
          "Fail",
          style: StyleManager.fontMedium14,
        ),
        ButtonState.success: Text(
          "Success",
          style: StyleManager.fontMedium14,
        )
      },
      stateColors: {
        ButtonState.idle: ColorsHelper.blue,
        ButtonState.loading: ColorsHelper.blue,
        ButtonState.fail: Colors.red.shade700,
        ButtonState.success: Colors.green.shade400
      },
      state: currentState,
      onPressed: onPressed,
    );
  }
}
