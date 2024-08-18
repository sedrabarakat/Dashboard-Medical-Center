import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../doctors/data/model/doctor_model.dart';
class DoctorCardAddAppointment extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onTap;

  const DoctorCardAddAppointment({super.key, required this.doctor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorsHelper.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Section: ${doctor.section?.sectionName}',
                style: StyleManager.fontRegular16.copyWith(color: false?ColorsHelper.white:ColorsHelper.black),
              ),
              SizedBox(width: 10.w),
              Text(
                '${doctor.userData.firstName} ${doctor.userData.lastName}',
                style: StyleManager.fontRegular16.copyWith(color: false?ColorsHelper.white:ColorsHelper.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
