import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/columns_of_texts.dart';
import '../../../../../core/widgets/pic_name_widget.dart';
import '../../../../doctors/presentation/widgets/profile_widget/info_col.dart';
import '../../../domain/constants/consts.dart';
import '../../cubits/patient_cubit.dart';

class ProfileInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    PatientCubit cubit= PatientCubit.get(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 30.w, vertical: 50.h),
      height: 920.h,
      width: 1100.w,
      decoration: StyleManager.rounded40(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PicAndName(context: context, cubit: cubit),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextsCol(texts: fields1),
                infoCol1(context: context),
                SizedBox(
                  width: 120.w,
                ),
                TextsCol(texts: fields2),
                infoCol2(context: context),
              ],
            )
          ],
        ),
      ),
    );
  }
}