import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/editing_buttons.dart';
import '../../cubits/patient_cubit.dart';
import 'image_widget.dart';
import 'name_widget.dart';

Widget PicAndName({required context}){
  PatientCubit cubit=PatientCubit.get(context);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image_widget(image:cubit.image),
      SizedBox(
        width: 30.w,
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: nameWidget(
          first_name: cubit.First_name,
          Last_name: cubit.Last_name,
          is_Editig: cubit.isEditing,
        ),
      ),
      editingInfoButtons(cubit: cubit)
    ],
  );
}