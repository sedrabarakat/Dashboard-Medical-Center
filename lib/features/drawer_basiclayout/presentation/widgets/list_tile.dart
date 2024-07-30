import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

Widget listTileWidget({
  required int index,
  required int spIndex,
  required IconData icon,
  required String text,
  required GestureTapCallback onTap,
  double radius = 40,
}) {
  return ListTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    leading: Icon(
      icon,
      color: (index == spIndex) ? Colors.white : ColorsHelper.blue,
    ),
    title: Text(
      text,
      style: TextStyle(color: (index == spIndex) ? Colors.white : ColorsHelper.blue),
    ),
    tileColor: (index == spIndex) ? ColorsHelper.blue.withOpacity(.9) : null,
    onTap: onTap,
  );
}
