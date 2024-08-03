import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/features/patients/presentation/cubits/patient_cubit.dart';
import 'package:dashboad/features/patients/presentation/widgets/profile_widgets/information_col.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/validator_manager.dart';
import '../../../../core/widgets/columns_of_texts.dart';
import '../../../../core/widgets/drop_down.dart';
import '../../../../core/widgets/editing_buttons.dart';
import '../../../../core/widgets/editing_dropdown.dart';
import '../../../../core/widgets/editing_field.dart';
import '../../../../core/widgets/text_from_field.dart';
import '../../../create_account/domain/constants/constants.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';
import '../../domain/constants/consts.dart';
import '../widgets/profile_widgets/image_widget.dart';
import '../widgets/profile_widgets/name_widget.dart';
import '../widgets/profile_widgets/pic_name_widget.dart';

class PatientProfile extends StatelessWidget {
  int id;

  PatientProfile({required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {},
        builder: (context, state) {
          PatientCubit cubit = PatientCubit.get(context);
          bool isEditing = cubit.isEditing;
          return Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: ConditionalBuilder(
                condition: cubit.patientModel!=null,
                builder: (context) => Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 50.h),
                      height: 920.h,
                      width: 900.w,
                      decoration: StyleManager.rounded40(color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PicAndName(context:context),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextsCol(texts: fields1),
                                infoCol1(context: context),
                                SizedBox(width: 50.w,),
                                TextsCol(texts: fields2),
                                infoCol2(context: context),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Container(
                      ///tuqa's container...Gooood Luckk :)
                      height: 920.h,
                      width: 350.w,
                      decoration: StyleManager.rounded40(color: Colors.white),
                    )
                  ],
                ),
                fallback: (context) =>  Lottie.asset(
                    AssetsManager.loadingPatient,width: 500.w,height: 500.h),
              ));
        });
  }
}
