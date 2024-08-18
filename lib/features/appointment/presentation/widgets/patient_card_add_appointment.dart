import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../patients/data/models/patient_model.dart';
class PatientCardAddAppointment extends StatelessWidget {
  final PatientModel patient;
  final VoidCallback onTap;
  final bool isSelected ;

  const PatientCardAddAppointment({super.key, required this.patient, required this.onTap, this.isSelected = false,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color:isSelected ? ColorsHelper.blueLight : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'ID: ${patient.id}',
                style:StyleManager.fontRegular16.copyWith(
                  color: isSelected ? ColorsHelper.white : Colors.black
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                '${patient.userData.firstName} ${patient.userData.lastName}',
                style:StyleManager.fontRegular16.copyWith(
                    color: isSelected ? ColorsHelper.white : Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



