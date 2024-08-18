import 'package:flutter/material.dart';

import '../helpers/colors_helper.dart';
import '../utils/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = ColorsHelper.blueDark,
  });
  final String label;
  final void Function()? onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        //todo Change the size
        minimumSize: const Size(100, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: StyleManager.fontMedium16White,
      ),
    );
  }
}
