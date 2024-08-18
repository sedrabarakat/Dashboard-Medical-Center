import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/text_from_field.dart';

Widget nameWidget(
    {required TextEditingController first_name,
    required TextEditingController Last_name,
    required bool is_Editig}) {
  return (is_Editig)
      ? Flexible(
        child: Row(
            children: [
              Container(
                  width: 150.w,
                  child: TextFild_def(
                    radius: 2,
                    borderStyle: StyleManager.FieldBorder_round40,
                    filled: false,
                    fillColor: Colors.white,
                    controller: first_name,
                    readOnly: (is_Editig) ? false : true,
                    textStyle: StyleManager.font30Bold_Lobster.copyWith(color: ColorsHelper.blueDark),
                  )),
              SizedBox(
                  width: 150.w,
                  child: TextFild_def(
                    radius: 2,
                    borderStyle: StyleManager.FieldBorder_round40,
                    filled: false,
                    fillColor: Colors.white,
                    controller: Last_name,
                    readOnly: (is_Editig) ? false : true,
                    textStyle: StyleManager.font30Bold_Lobster.copyWith(color: ColorsHelper.blueDark),
                  )),
            ],
          ),
      )
      : Flexible(
        child: Row(
            children: [
              Text(
                first_name.text,
                style: StyleManager.font30Bold_Lobster
                    .copyWith(color: ColorsHelper.blueDark),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                Last_name.text,
                style: StyleManager.font30Bold_Lobster
                    .copyWith(color: ColorsHelper.blueDark),
              )
            ],
          ),
      );
}
