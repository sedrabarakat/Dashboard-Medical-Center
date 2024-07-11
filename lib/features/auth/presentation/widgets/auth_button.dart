import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:progress_loading_button/progress_loading_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p18,
        ),
        backgroundColor: ColorsHelper.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        label,
        style: StyleManager.fontMedium14,
      ),
    );
  }
}

class DefaultLoadingButton extends StatelessWidget {
  const DefaultLoadingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.color = ColorsHelper.teal,
  });
  final String label;
  final double? width;
  final Color? color;
  final Future<dynamic> Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      defaultWidget: Text(
        label,
        style: StyleManager.fontMedium14,
      ),
      color: color ?? ColorsHelper.teal,
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p18,
      ),
      borderRadius: 10,
      onPressed: onPressed,
    );
  }
}
