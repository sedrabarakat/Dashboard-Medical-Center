import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/drop_down.dart';

class Text_DropDown extends StatelessWidget{

  String text;
  List<String> dropdownItems;
  ValueChanged OnChanged;
  String ? selectedItem;

  Text_DropDown({required this.text
    ,required this.OnChanged,
    required this.dropdownItems,
    this.selectedItem
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Text(text,style: StyleManager.fontRegular20.copyWith(color: ColorsHelper.black54),),
        ),
        SizedBox(height: 8.h,),
        Dropdown(dropdownItems: dropdownItems, OnChanged: OnChanged,selectedItem: selectedItem,hintText: "Select Section",),
      ],
    );
  }
}