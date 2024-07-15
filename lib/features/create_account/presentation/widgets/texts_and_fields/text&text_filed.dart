import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/text_from_field.dart';

class Text_TextFiled extends StatelessWidget{

  String text;
  TextEditingController controller;
   int? maxLine;
   String? Function(String?)? validator;
   Function(String)? onChanged;
   VoidCallback? onTap;



  Text_TextFiled({required this.text,required this.controller,
    this.maxLine,this.onTap,this.onChanged,this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Text(text,style: StyleManager.fontRegular20.copyWith(color: ColorsHelper.black54),),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
            width: 250.w,
            child: TextFiled(radius: 40,controller: controller,
              onTap: onTap,onChanged: onChanged,validator: validator,maxLine: maxLine,)),
      ],
    );
  }
}