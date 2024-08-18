import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Dropdown extends StatefulWidget {
  Dropdown(
      {super.key,
      required this.dropdownItems,
      required this.onChanged,
      required this.hintText,
      this.borderStyle,
      this.selectedItem,
      this.validator,
      this.fillColor,
      this.filled = true});

  final List<String> dropdownItems;
  final ValueChanged onChanged;
  final String? Function(String?)? validator;
  final bool filled;
  InputBorder? borderStyle = StyleManager.Border_round40;
  String? selectedItem;
  String? hintText;
  Color? fillColor;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: widget.borderStyle,
              enabledBorder: widget.borderStyle,
              focusedBorder: widget.borderStyle,
              filled: widget.filled,
              fillColor: (widget.fillColor != null)
                  ? widget.fillColor
                  : ColorsHelper.blueLightest,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              hintText: widget.hintText),
          value: widget.selectedItem,
          focusColor: ColorsHelper.blueLightest,
          hint: widget.hintText != null ? Text(widget.hintText!) : null,
          items: widget.dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          validator: widget.validator,
          onChanged: (value) {
            setState(() {
              widget.selectedItem = value;
            });
            widget.onChanged(value);
          }),
    );
  }
}
