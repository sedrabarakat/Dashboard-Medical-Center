import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  Dropdown(
      {required this.dropdownItems,
      required this.OnChanged,
      required this.hintText,
      this.selectedItem,
      required this.borderStyle,
      this.validator,
      this.fillColor,
      this.filled = true});

  List<String> dropdownItems;
  ValueChanged OnChanged;
  final String? Function(String?)? validator;
  String? selectedItem;
  String hintText;
  InputBorder borderStyle = StyleManager.Border_round40;
  final bool? filled;
  final Color ? fillColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border:        borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: borderStyle,
              filled: filled,
              fillColor: (fillColor!=null)?fillColor:ColorsHelper.blueLightest,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              hintText: hintText),
          value: selectedItem,
          focusColor: ColorsHelper.blueLightest,
          hint: Text(hintText),
          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          validator: validator,
          onChanged: OnChanged),
    );
  }
}
