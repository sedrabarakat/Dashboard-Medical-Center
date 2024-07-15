import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Dropdown extends StatelessWidget{

  Dropdown({required this.dropdownItems,required this.OnChanged,required this.hintText,this.selectedItem});

  List<String> dropdownItems;
  ValueChanged OnChanged;

  String? selectedItem;
  String hintText;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:  250.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsHelper.grey300,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      child: DropdownButtonHideUnderline(

        child: DropdownButton<String>(
          value: selectedItem,
          focusColor: ColorsHelper.tealLightest,
          hint: Text(hintText),

          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: OnChanged
        ),
      ),
    );
  }
}