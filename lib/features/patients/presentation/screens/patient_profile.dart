import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
import '../../../../core/widgets/columns_of_texts.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';
import '../../domain/constants/consts.dart';
import '../widgets/profile_widgets/pic_name_widget.dart';
import '../widgets/session_container.dart';

class PatientProfile extends StatelessWidget {
  final int id;

  const PatientProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {},
        builder: (context, state) {
          PatientCubit cubit = PatientCubit.get(context);
          bool isEditing = cubit.isEditing;
          return BaseLayout(
            child: Padding(
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
                      Flexible(child: SessionContainer(id: id)),
                    ],
                  ),
                  fallback: (context) =>  Lottie.asset(
                      AssetsManager.loadingPatient,width: 500.w,height: 500.h),
                )),
          );
        });
  }
}





