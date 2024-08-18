import 'package:dashboad/features/appointment/presentation/widgets/time_tile.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/helpers/dimensions_helper.dart';
import '../../../../core/utils/values_manager.dart';
class AvailableTimeList extends StatefulWidget {
  const AvailableTimeList({
    super.key,
    this.numberOfColumn = 4, required this.times,
  });
  final int numberOfColumn;
  final List<String> times;

  @override
  State<AvailableTimeList> createState() => _AvailableTimeListState();
}

class _AvailableTimeListState extends State<AvailableTimeList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: AppMargin.m10,
        spacing: AppMargin.m10,
        children: List.generate(
            widget.times.length, (index) {
            double width = DimensionsHelper.widthPercentage(context, 100) -
              AppPadding.appPadding.horizontal -
              (AppMargin.m10 * widget.numberOfColumn);
          return TimeTile(time:widget.times[index] ,
            isSelected: selectedIndex == index,
            width: width * (1 / widget.numberOfColumn),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }),
        // clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
