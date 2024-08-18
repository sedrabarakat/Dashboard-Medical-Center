import 'package:flutter/material.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';

class TimeTile extends StatelessWidget {
  final String time;
  const TimeTile({
    super.key,
    this.width = 80,
    required this.isSelected,
    required this.onTap, required this.time,
  });
  final double width;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsHelper.blueDark
              : ColorsHelper.blueLight.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            time,
            style: StyleManager.fontMedium16White.copyWith(
              color: isSelected ? ColorsHelper.white : ColorsHelper.black,
            ),
          ),
        ),
      ),
    );
  }
}
