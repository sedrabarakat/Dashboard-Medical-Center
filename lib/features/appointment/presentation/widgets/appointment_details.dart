import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/datasources/local.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/helpers/json_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../patients/data/models/patient_model.dart';
import '../../data/models/appointment_model.dart';
import '../../data/models/working_hours_model.dart';
import '../cubit/appointment_cubit.dart';
import '../cubit/appointment_state.dart';

class AppointmentDetails extends StatefulWidget {
  final AppointmentModel appointment;

  const AppointmentDetails({
    super.key,
    required this.appointment,
  });

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  late DateTime selectedDate;

  String? selectedTime;
  bool isEditing = false;
  WorkingHoursModel? workingHours;

  @override
  void initState() {
    super.initState();
    try {
      selectedDate = DateTime.parse(widget.appointment.date);
    } catch (e) {
      selectedDate = DateTime.now();
    }
    selectedTime = widget.appointment.startMin;

    context
        .read<AppointmentCubit>()
        .getScheduleForDoctor(widget.appointment.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        if (state is GetScheduleForDoctorSuccessState) {
          workingHours = state.workingHoursModel;
        }
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctor: ${widget.appointment.doctorFirstname + widget.appointment.doctorLastName}',
                    style: StyleManager.font20W600
                        .copyWith(color: ColorsHelper.blueDarkest),
                  ),
                  const SizedBox(height: AppSize.s4),
                  Text(
                    'Patient:  ${widget.appointment.patientFirstName + widget.appointment.patientLastName}',
                    style: StyleManager.fontRegular16,
                  ),
                  const SizedBox(height: AppSize.s4),
                  InkWell(
                    onTap: isEditing ? _selectData : null,
                    child: Text(
                      'Date:      ${widget.appointment.date.toString()}',
                      style: StyleManager.fontRegular16.copyWith(
                        decoration: isEditing ? TextDecoration.underline : null,
                        color: isEditing ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s4),
                  InkWell(
                    onTap: isEditing ? _selectTime : null,
                    child: Text(
                      'Time:     ${widget.appointment.startMin.toString()}',
                      style: StyleManager.fontRegular16.copyWith(
                        decoration: isEditing ? TextDecoration.underline : null,
                        color: isEditing ? Colors.blue : Colors.black,
                      ),
                    ),
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
                          .deleteAppointment(context, widget.appointment.id);
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
                    onTap: () {
                      setState(() {
                        isEditing = !isEditing;
                        context
                            .read<AppointmentCubit>()
                            .getScheduleForDoctor(widget.appointment.doctorId);
                      });
                    },
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
              if (isEditing) ...[
                const SizedBox(
                  height: AppSize.s16,
                ),
                InkWell(
                  onTap: _submitChanges,
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorsHelper.success,
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: StyleManager.fontRegular16
                            .copyWith(color: ColorsHelper.white, fontSize: 14),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 12),
      ),
      helpText: 'Select new Date :',
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        debugPrint(selectedDate.toString());
        selectedTime = null;
      });
    }
  }

  Future<void> _selectTime() async {
    if (workingHours == null) {
      debugPrint('Null schedule hours ');
      return;
    }
    String dayOfWeek = _getDayOfWeek(selectedDate);
    List<String> availableTimeSlots = [];
    switch (dayOfWeek) {
      case 'Sunday':
        availableTimeSlots = workingHours!.sunday;
      case 'Monday':
        availableTimeSlots = workingHours!.monday;
      case 'Tuesday':
        availableTimeSlots = workingHours!.tuesday;
      case 'Wednesday':
        availableTimeSlots = workingHours!.wednesday;
      case 'Thursday':
        availableTimeSlots = workingHours!.thursday;
      case 'Friday':
        availableTimeSlots = workingHours!.friday;
      case 'Saturday':
        availableTimeSlots = workingHours!.saturday;
    }

    final String? pickedTime = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.timer,
                color: ColorsHelper.blueDark,
              ),
              Text(
                'Select Time',
                style: StyleManager.font30Bold_Lobster
                    .copyWith(color: ColorsHelper.blueDark),
              ),
            ],
          ),
          content: availableTimeSlots.isNotEmpty
              ? SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: availableTimeSlots.map((time) {
                return ListTile(
                  title: Text(time),
                  onTap: () {
                    Navigator.pop(context, time);
                  },
                );
              }).toList(),
            ),
          )
              : Text("No available time slots for $dayOfWeek"),
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String _getDayOfWeek(DateTime date) {
    return [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ][date.weekday % 7];
  }

  List<PatientModel> _patients = [];
  Future<int> getPatientId(String firstName, String lastName)async{
    List<String> patientCachedList =
        await SharedPrefrence.getListOfString('patients');
    // Check if there is cached data if true then return the cached data
    if (patientCachedList.isNotEmpty) {
      _patients = JsonHelper.convertListOfStringToListOfObjects<PatientModel>(
        patientCachedList,
        PatientModel.fromJson,
      );
  }
    for(int i = 0 ; i <_patients.length; i++){
      if(_patients[i].userData.firstName == firstName && _patients[i].userData.lastName == lastName) {
        return _patients[i].id ;
      }
    }
    return -1 ;
    }

  void _submitChanges()async {
    int patientId = await getPatientId(widget.appointment.patientFirstName, widget.appointment.patientLastName);
        context.read<AppointmentCubit>().updateAppointment(
      widget.appointment.id,
      patientId,
      widget.appointment.doctorId,
      selectedDate.toString(),
      selectedTime ?? widget.appointment.startMin,
    );

    debugPrint('submit changes done');
    debugPrint(selectedTime.toString());
    debugPrint(selectedDate.year.toString());
    setState(() {
      isEditing = false;
    });
  }
}