import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTile_Widget({
  required int index,
  required int sp_index,
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
      color: (index == sp_index) ? Colors.white : Colors.teal,
    ),
    title: Text(
      text,
      style: TextStyle(color: (index == sp_index) ? Colors.white : Colors.teal),
    ),
    tileColor: (index == sp_index) ? Colors.teal.withOpacity(.7) : null,
    onTap: onTap,
  );
}
