
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../data/models/appointment_model.dart';
import '../cubit/appointment_cubit.dart';

class AppointmentDetails extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentDetails({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Doctor: ${appointment.doctorFirstname + appointment.doctorLastName}',
                style: StyleManager.font20W600
                    .copyWith(color: ColorsHelper.blueDarkest),
              ),
              const SizedBox(height: AppSize.s4),
              Text(
                'Patient:  ${appointment.patientFirstName + appointment.patientLastName}',
                style: StyleManager.fontRegular16,
              ),
              const SizedBox(height: AppSize.s4),
              Text(
                'Date:      ${appointment.date.toString()}',
                style: StyleManager.fontRegular16,
              ),
              const SizedBox(height: AppSize.s4),
              Text(
                'Time:     ${appointment.startMin.toString()}',
                style: StyleManager.fontRegular16,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<AppointmentCubit>()
                      .deleteAppointment(context, appointment.id);
                },
                child: Container(
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsHelper.blue,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}