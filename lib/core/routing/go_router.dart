import 'package:dashboad/core/helpers/token_helper.dart';
import 'package:dashboad/features/appointment/presentation/screens/add_appointment.dart';
import 'package:dashboad/features/auth/presentation/screens/login_screen.dart';
import 'package:dashboad/features/create_account/presentation/screens/add_account.dart';
import 'package:dashboad/features/director/presentation/screens/directors_list.dart';
import 'package:dashboad/features/doctors/presentation/screens/doctors_list.dart';
import 'package:dashboad/features/inbox/presentation/screens/inbox.dart';
import 'package:dashboad/features/laboratory/presentation/screens/laboratories_list.dart';
import 'package:dashboad/features/sections/presentation/screens/sections_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/appointment/presentation/screens/all_appointment_screen.dart';
import '../../features/appointment/presentation/screens/test_appointmenet.dart';
import '../../features/doctors/presentation/screens/doctor_profile.dart';
import '../../features/patients/presentation/screens/patient_profile.dart';
import '../../features/patients/presentation/screens/patients_list.dart';

class WebRouter {


  static const kLogin = 'Login';
  static const kAddAccount = 'add_account';
  static const kDirectorsList = 'Directors_list';
  static const kDoctorList = 'Doctor_list';
  static const kDoctorProfile = 'Doctor_profile';
  static const kPatientList = 'Patient_list';
  static const kPatientProfile = 'Patient_profile';
  static const kLaboratory = 'Laboratory';
  static const kReseptionsList = 'Reseptions_list';
  static const kSectionsList = 'Seconts_list';
  static const kInbox = 'Inbox';
 // static const kSession ='Session' ;
  static const kAllAppointment ='Appointments' ;
  static const kAddAppointment ='AddAppointment' ;

  static GoRouter router = GoRouter(
    initialLocation: TokenHelper.hasToken ? '/add_account' : '/',
    //initialLocation:"/Patients_List/Patient_profile/:2",
    routes: [
      GoRoute(
        path: '/',
        name: kLogin,
        pageBuilder: (context, state) =>
            MaterialPage(
              child: LoginPage(),
            ),
      ),
      GoRoute(
        path: '/add_account',
        name: kAddAccount,
        pageBuilder: (context, state) {
          return MaterialPage(child: AddAccount());
        },
      ),
      GoRoute(
        path: '/Directors_list',
        name: kDirectorsList,
        pageBuilder: (context, state) {
          return const MaterialPage(child: DirectorsList());
        },
      ),
      GoRoute(
          path: '/Doctors_List',
          name: kDoctorList,
          pageBuilder: (context, state) {
            return const MaterialPage(child: DoctorList());
          },
          routes: [
            GoRoute(
              path: 'Doctor_profile/:Doctor_id',
              name: kDoctorProfile,
              pageBuilder: (context, state) {
                return const MaterialPage(child: DoctorProfile());
              },
            ),
          ]),
      GoRoute(
          path: '/Patients_List',
          name: kPatientList,
          pageBuilder: (context, state) {
            return const MaterialPage(child: PatientsList());
          },
          ),
      GoRoute(
        path: '/Patients_List/Patient_profile/:Patient_id',
        name: kPatientProfile,
        pageBuilder: (context, state) {
          int Patient_id=int.parse(state.pathParameters['Patient_id']!);
          return MaterialPage(child: PatientProfile(id: Patient_id,));
        },
      ),
      GoRoute(
        path: '/Laboratory',
        name: kLaboratory,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LaboratoriesList());
        },
      ),
      GoRoute(
        path: '/Sections_list',
        name: kSectionsList,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SectionsList());
        },
      ),
      GoRoute(
        path: '/Inbox',
        name: kInbox,
        pageBuilder: (context, state) {
          return const MaterialPage(child: Inbox());
        },
      ),
      GoRoute(path: '/appointment', name: kAllAppointment, pageBuilder: (context, state){
        return const MaterialPage(child: AllAppointmentScreen());
      }),
      GoRoute(path: '/addAppointment', name: kAddAppointment, pageBuilder: (context, state){
        return const MaterialPage(child: TestAppointment());
      })
    ],
  );
}
