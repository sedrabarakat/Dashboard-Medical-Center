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
      color: (index == spIndex) ? Colors.white : Colors.teal,
    ),
    title: Text(
      text,
      style: TextStyle(color: (index == spIndex) ? Colors.white : Colors.teal),
    ),
    tileColor: (index == spIndex) ? Colors.teal.withOpacity(.7) : null,
    onTap: onTap,
  );
}
