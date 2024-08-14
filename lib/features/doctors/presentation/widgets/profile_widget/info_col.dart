import 'package:dashboad/core/widgets/editing/editing_dropdown.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../../core/widgets/editing/editing_field.dart';
import '../../../../../core/widgets/text_from_field.dart';
import 'work_days.dart';

Widget infoCol1({required context}) {
  DoctorCubit cubit = DoctorCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(controller: cubit.middleName, is_Editig: isEditing),
      editingFields(controller: cubit.phone, is_Editig: isEditing),
      editingDropDown(
          dropdownItems: cubit.sectionsName!,
          selectedItem: cubit.section.text,
          selection: "Select Section",
          is_Editig: isEditing,
          onChanged: (value) {
            for (var section in cubit.sections) {
              if (section.containsKey(value)) {
                cubit.selectSectionId(id: section[value]!);
              }
            }
          }),
      editingFields(controller: cubit.description, is_Editig: isEditing),
    ],
  );
}

Widget infoCol2({required context}) {
  DoctorCubit cubit = DoctorCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(controller: cubit.duration, is_Editig: isEditing),
      editingFields(controller: cubit.dayInAdvance, is_Editig: isEditing),
      if (isEditing)
        SizedBox(
          width: 210.w,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w),
            child: TextFild_def(
              hintText: 'Working Hours',
              onTap: () {
                showCupertinoDialog(
                    context: context,
                    builder: (_) => AlertDialouge(Submit_onPressed: () {
                          cubit.addDoctorSchedule();
                        }));
              },
              textStyle: StyleManager.fontRegular20
                  .copyWith(color: ColorsHelper.blueDarkest),
              fillColor: ColorsHelper.blueLightest.withOpacity(.3),
              borderStyle: StyleManager.Border_round40Blue,
              validator: (value) => ValidatorManager.instance
                  .validate_EmptyState(
                      value ?? '', "Working hour...At least one"),
            ),
          ),
        ),
    ],
  );
}
