import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({
    super.key,
    this.headerPadding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 8,
    ),
    this.headerTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  });
  final EdgeInsets headerPadding;
  final TextStyle headerTextStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsHelper.lightGry,
          ),
        ),
      ),
      padding: headerPadding,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              "Name",
              style: headerTextStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "User Role",
              style: headerTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Actions",
              style: headerTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
