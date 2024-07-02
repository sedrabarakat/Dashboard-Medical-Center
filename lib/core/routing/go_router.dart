import 'package:dashboad/features/create_account/presentation/screens/add_account.dart';
import 'package:dashboad/features/director/presentation/screens/directors_list.dart';
import 'package:dashboad/features/doctors/presentation/screens/doctors_list.dart';
import 'package:dashboad/features/inbox/presentation/screens/inbox.dart';
import 'package:dashboad/features/laboratory/presentation/screens/laboratories_list.dart';
import 'package:dashboad/features/reseptions/presentation/screens/reseptions_list.dart';
import 'package:dashboad/features/sections/presentation/screens/sections_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/doctors/presentation/screens/doctor_profile.dart';
import '../../features/patients/presentation/screens/patient_profile.dart';
import '../../features/patients/presentation/screens/patients_list.dart';

class WebRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/add_account',
    routes: [
      GoRoute(
        path: '/add_account',
        name: 'add_account',
        pageBuilder: (context, state) {
          return MaterialPage(child: AddAccount());
        },
      ),
      GoRoute(
        path: '/Directors_list',
        name: 'Directors_list',
        pageBuilder: (context, state) {
          return MaterialPage(child: DirectorsList());
        },
      ),
      GoRoute(
          path: '/Doctors_List',
          name: 'Doctors_List',
          pageBuilder: (context, state) {
            return MaterialPage(child: DoctorList());
          },
          routes: [
            GoRoute(
              path: 'Doctor_profile/:Doctor_id',
              name: 'Doctor_profile',
              pageBuilder: (context, state) {
                return MaterialPage(child: DoctorProfile());
              },
            ),
          ]),
      GoRoute(
          path: '/Patients_List',
          name: 'Patients_List',
          pageBuilder: (context, state) {
            return MaterialPage(child: PatientsList());
          },
          routes: [
            GoRoute(
              path: 'Patient_profile/:Patient_id',
              name: 'Patient_profile',
              pageBuilder: (context, state) {
                return MaterialPage(child: PatientProfile());
              },
            ),
          ]),
      GoRoute(
        path: '/Laboratory',
        name: 'Laboratory',
        pageBuilder: (context, state) {
          return MaterialPage(child: LaboratoriesList());
        },
      ),
      GoRoute(
        path: '/Reseptions_list',
        name: 'Reseptions_list',
        pageBuilder: (context, state) {
          return MaterialPage(child: ReseptionsList());
        },
      ),
      GoRoute(
        path: '/Sections_list',
        name: 'Sections_list',
        pageBuilder: (context, state) {
          return MaterialPage(child: SectionsList());
        },
      ),
      GoRoute(
        path: '/Inbox',
        name: 'Inbox',
        pageBuilder: (context, state) {
          return MaterialPage(child: Inbox());
        },
      ),
    ],
  );
}
