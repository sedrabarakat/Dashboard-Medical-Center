import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'editing/editing_buttons.dart';
import '../../features/patients/presentation/widgets/profile_widgets/image_widget.dart';
import '../../features/patients/presentation/widgets/profile_widgets/name_widget.dart';

Widget PicAndName({required context, required cubit}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image_widget(image: cubit.image),
      SizedBox(
        width: 30.w,
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: nameWidget(
          first_name: cubit.firstName,
          Last_name: cubit.lastName,
          is_Editig: cubit.isEditing,
        ),
      ),
      editingInfoButtons(cubit: cubit)
    ],
  );
}
