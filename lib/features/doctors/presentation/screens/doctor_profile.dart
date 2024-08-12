import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dashboad/features/doctors/domain/constants/const.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';
import 'package:dashboad/features/doctors/presentation/widgets/profile_widget/info_col.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/columns_of_texts.dart';
import '../../../../core/widgets/pic_name_widget.dart';
import '../widgets/profile_widget/doctor_schedule.dart';

class DoctorProfile extends StatelessWidget {
  final int id;

  const DoctorProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorCubit cubit = DoctorCubit.get(context);
          return Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: ConditionalBuilder(
                condition: cubit.doctorModel != null,
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
                            PicAndName(context: context, cubit: cubit),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextsCol(texts: Docfields1),
                                infoCol1(context: context),
                                SizedBox(
                                  width: 50.w,
                                ),
                                TextsCol(
                                    texts:
                                        Docfields2(isEditing: cubit.isEditing)),
                                infoCol2(context: context)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    doctorSchedule(cubit: cubit)
                  ],
                ),
                fallback: (context) => Lottie.asset(
                    AssetsManager.loadingPatient,
                    width: 500.w,
                    height: 500.h),
              ));
        });
  }
}
