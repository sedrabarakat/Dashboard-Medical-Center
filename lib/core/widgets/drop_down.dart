import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
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
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border:        widget.borderStyle,
              enabledBorder: widget.borderStyle,
              focusedBorder: widget.borderStyle,
              filled: widget.filled,
              fillColor: (widget.fillColor!=null)?widget.fillColor:ColorsHelper.blueLightest,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              hintText: widget.hintText),
          value: widget.selectedItem,
          focusColor: ColorsHelper.blueLightest,
          hint: Text(widget.hintText),
          items: widget.dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          validator: widget.validator,
          onChanged: (value){
            setState(() {
              widget.selectedItem=value;
            });
            widget.OnChanged(value);
          }),
    );
  }
}
