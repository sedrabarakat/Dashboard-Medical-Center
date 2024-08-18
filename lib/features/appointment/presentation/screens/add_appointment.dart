import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/table/shimmer_table_row.dart';
import '../../../auth/presentation/widgets/custom_state_button.dart';
import '../widgets/available_time_list.dart';
import '../widgets/custom_calender.dart';
import '../widgets/doctor_card_add_appointment.dart';
import '../widgets/patient_card_add_appointment.dart';

class AddAppointment extends StatelessWidget {
  const AddAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(getIt())
        ..getPatients()
        ..getDoctors(),
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<AppointmentCubit>(context);

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              decoration: StyleManager.rounded40(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Book new Appointment:',
                    style: StyleManager.font30Bold_Lobster,
                  ),
                  SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 5)),
                  _buildPatientsSection(context, state),
                  SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 2)),
                  _buildDoctorsSection(context, state, cubit),
                  const SizedBox(height: AppSize.s20),
                  CustomStateButton(
                    label: 'Book',
                    onPressed: () {
                      debugPrint('click on book');
                      debugPrint(
                          "${cubit.addAppointmentPatientId}${cubit.addAppointmentPatientId}${cubit.addAppointmentDayOfWeek}${cubit.formattedDate}");
                      cubit.addNewAppointment();
                    },
                    currentState: cubit.bookButtonState,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPatientsSection(BuildContext context, AppointmentState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose A Patient',
          style: StyleManager.fontExtraBold14Black,
        ),
        SizedBox(height: DimensionsHelper.heightPercentage(context, 5)),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          buildWhen: (previous, current) {
            return current is GetPatientsLoadingState ||
                current is GetPatientSuccessState ||
                current is GetPatientsErrorState ||
                current is AppointmentPatientIdUpdatedState;
          },
          builder: (context, state) {
            var cubit = context.read<AppointmentCubit>();
            if (state is GetPatientsLoadingState) {
              return SizedBox(
                height: 200.h,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const ShimmerTableRow(),
                ),
              );
            } else if (state is GetPatientSuccessState) {
              return SizedBox(
                height: 200.h,
                child: ListView.builder(
                  itemCount: state.patients.length,
                  itemBuilder: (context, index) {
                    var patient = state.patients[index];
                    return PatientCardAddAppointment(
                      patient: patient,
                      isSelected: cubit.selectedPatientId == patient.id,
                      onTap: () {
                        print('Selected Patient ID: ${patient.id}');
                        cubit.setAppointmentPatientId(patient.id);
                        cubit.setSelectedPatientId(patient.id);
                      },
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  Widget _buildDoctorsSection(
      BuildContext context, AppointmentState state, AppointmentCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose A Doctor',
          style: StyleManager.fontExtraBold14Black,
        ),
        SizedBox(height: DimensionsHelper.heightPercentage(context, 5)),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          buildWhen: (previous, current) {
            return current is GetDoctorsLoadingState ||
                current is GetDoctorsSuccessState ||
                current is GetDoctorsErrorState ||
                current is AppointmentDoctorIdUpdatedState;
          },
          builder: (context, state) {
            var cubit = context.read<AppointmentCubit>();
            if (state is GetDoctorsLoadingState) {
              return SizedBox(
                height: 100.h,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const ShimmerTableRow(),
                ),
              );
            } else if (state is GetDoctorsSuccessState) {
              return Column(
                children: [
                  SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      itemCount: state.doctors.length,
                      itemBuilder: (context, index) {
                        var doctor = state.doctors[index];
                        return DoctorCardAddAppointment(
                          doctor: doctor,
                          onTap: () {
                            debugPrint('Selected Doctor ID: ${doctor.id}');
                            context
                                .read<AppointmentCubit>()
                                .getScheduleForDoctor(doctor.id);
                            cubit.addAppointmentDoctorId = doctor.id;
                            cubit.setSelectedPatientId(doctor.id);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 5)),
                  Text(
                    'Choose date',
                    style: StyleManager.fontExtraBold14Black,
                  ),
                  SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 5)),
                  CustomCalender(
                    dayInAdvance: state
                        .doctors[cubit.addAppointmentDoctorId].daysInAdvance,
                    onCalenderIniti: (day) {
                      BlocProvider.of<AppointmentCubit>(context).selectedDate =
                          day;
                      BlocProvider.of<AppointmentCubit>(context)
                          .getAvailableTime(
                              state.doctors[cubit.addAppointmentDoctorId].id);
                    },
                    onDaySelected: (date) {
                      cubit.onDateSelected(date);
                      context.read<AppointmentCubit>().getAvailableTime(
                          state.doctors[cubit.addAppointmentDoctorId].id);
                    },
                  ),
                  BlocBuilder<AppointmentCubit, AppointmentState>(
                    buildWhen: (previous, current) {
                      return current is GetAvailableLoadingState ||
                          current is GetAvailableSuccessState ||
                          current is GetAvailableErrorState;
                    },
                    builder: (context, state) {
                      if (state is GetAvailableLoadingState) {
                        return SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) =>
                                const ShimmerTableRow(),
                          ),
                        );
                      } else if (state is GetAvailableSuccessState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Choose Time',
                              style: StyleManager.fontExtraBold14Black,
                            ),
                            const SizedBox(height: AppSize.s24),
                            SizedBox(
                              height: 200.h,
                              child: AvailableTimeList(
                                times: state.availableTimeModel.availableTimes,
                                numberOfColumn: 4,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
