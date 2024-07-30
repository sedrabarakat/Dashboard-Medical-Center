import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Dropdown extends StatelessWidget{

  Dropdown({required this.dropdownItems,required this.OnChanged,required this.hintText,this.selectedItem,required this.borderStyle
  ,this.validator});

  List<String> dropdownItems;
  ValueChanged OnChanged;
  final String? Function(String?)? validator;
  String? selectedItem;
  String hintText;
  InputBorder borderStyle=StyleManager.Border_round40;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: borderStyle,
            enabledBorder: borderStyle,
            focusedBorder: borderStyle,
            filled: true,
            fillColor: Colors.grey.shade300,
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
        onChanged: OnChanged
      ),
    );
  }
}