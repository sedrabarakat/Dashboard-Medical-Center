import 'package:dashboad/core/widgets/text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/colors_helper.dart';
import '../../utils/style_manager.dart';
import '../../utils/validator_manager.dart';

Widget editingFields(
    {required TextEditingController controller,
    required bool is_Editig,
    bool isAddress = false}) {
  return Padding(
    padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 10.w),
    child: SizedBox(
        width: 200.w,
        child: TextFild_def(
          radius: 2,
          maxLine: (isAddress) ? 2 : 4,
          borderStyle: (is_Editig)
              ? StyleManager.Border_round40Blue
              : StyleManager.FieldBorder_round40,
          filled: (is_Editig) ? true : false,
          fillColor: (is_Editig)
              ? ColorsHelper.blueLightest.withOpacity(.3)
              : Colors.white,
          validator: (value) => ValidatorManager.instance
              .validate_EmptyState(controller.text, "That field"),
          CursorColor: ColorsHelper.blueDark,
          controller: controller,
          readOnly: (is_Editig) ? false : true,
          textStyle: StyleManager.fontRegular20
              .copyWith(color: ColorsHelper.blueDarkest),
        )),
  );
}
