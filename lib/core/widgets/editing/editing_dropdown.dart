import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/colors_helper.dart';
import '../../utils/style_manager.dart';
import '../../utils/validator_manager.dart';
import '../drop_down.dart';

Widget editingDropDown(
    {required List<String> dropdownItems,
    required String selectedItem,
    required String selection,
    required bool is_Editig,
    var onChanged}) {
  return Padding(
    padding: EdgeInsets.only(top: 18.h, right: 10.w, left: 10.w),
    child: SizedBox(
        width: 250.w,
        child: (is_Editig)
            ? Dropdown(
                filled: (is_Editig) ? true : false,
                fillColor: (is_Editig)
                    ? ColorsHelper.blueLightest.withOpacity(.3)
                    : Colors.white,
                dropdownItems: dropdownItems,
                selectedItem: selectedItem,
                hintText: "$selection",
                borderStyle: (is_Editig)
                    ? StyleManager.Border_round40Blue
                    : StyleManager.FieldBorder_round40,
                validator: (value) => ValidatorManager.instance
                    .validate_EmptyState(selectedItem, "That field"),
                onChanged: (value) {
                  onChanged(value);
                },
              )
            : Text(
                "  $selectedItem",
                style: StyleManager.fontRegular20
                    .copyWith(color: ColorsHelper.blueDarkest),
              )),
  );
}
