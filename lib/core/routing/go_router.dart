import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/token_helper.dart';
import 'package:dashboad/features/appointment/presentation/screens/add_appointment.dart';
import 'package:dashboad/features/auth/presentation/screens/login_screen.dart';
import 'package:dashboad/features/create_account/presentation/screens/add_account.dart';
import 'package:dashboad/features/director/presentation/screens/directors_list.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';
import 'package:dashboad/features/doctors/presentation/screens/doctors_list.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/screens/baselayout.dart';
import 'package:dashboad/features/inbox/presentation/screens/inbox.dart';
import 'package:dashboad/features/laboratory/presentation/screens/laboratories_list.dart';
import 'package:dashboad/features/patients/presentation/cubits/patient_cubit.dart';
import 'package:dashboad/features/reseptions/presentation/screens/reseptions_list.dart';
import 'package:dashboad/features/sections/presentation/screens/add_section_screen.dart';
import 'package:dashboad/features/sections/presentation/screens/section_details.dart';
import 'package:dashboad/features/sections/presentation/screens/sections_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/appointment/presentation/screens/all_appointment_screen.dart';
import '../../features/appointment/presentation/screens/test_appointmenet.dart';
import '../../features/doctors/presentation/screens/doctor_profile.dart';
import '../../features/patients/presentation/screens/patient_profile.dart';
import '../../features/patients/presentation/screens/patients_list.dart';

class WebRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
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
  static const kSectionDetails = 'section_details';
  static const kAddSection = "add_section";
  static const kEditSection = "edit_section";
  static const kInbox = 'Inbox';

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: TokenHelper.hasToken ? '/add_account' : '/',
    routes: [
      GoRoute(
        path: '/',
        name: kLogin,
        pageBuilder: (context, state) => MaterialPage(
          child: LoginPage(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return BaseLayout(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/add_account',
                name: kAddAccount,
                builder: (context, state) {
                  return AddAccount();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Directors_list',
                name: kDirectorsList,
                builder: (context, state) {
                  return const DirectorsList();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Reseptions_list',
                name: kReseptionsList,
                builder: (context, state) {
                  return const ReseptionsList();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Sections_list',
                name: kSectionsList,
                builder: (context, state) {
                  return const SectionsList();
                },
                routes: [
                  GoRoute(
                    path: 'section_details/:id/:name',
                    name: kSectionDetails,
                    builder: (context, state) {
                      int id = int.parse(state.pathParameters['id']!);
                      String name = state.pathParameters['name']!;
                      return SectionDetails(
                        id: id,
                        name: name,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'add_section',
                    name: kAddSection,
                    builder: (context, state) => const AddSectionScreen(
                      edit: false,
                    ),
                  ),
                  GoRoute(
                    path: 'edit_section',
                    name: kEditSection,
                    builder: (context, state) =>
                        const AddSectionScreen(edit: true),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Doctors_List',
                name: kDoctorList,
                builder: (context, state) {
                  return const DoctorList();
                },
                routes: [
                  GoRoute(
                    path: 'Doctor_profile/:Doctor_id',
                    name: kDoctorProfile,
                    builder: (context, state) {
                      int Doctor_id=int.parse(state.pathParameters['Doctor_id']!);
                      return BlocProvider(
                        create: (context)=>DoctorCubit(getIt())..getSections(context: context)
                          ..setId(id: Doctor_id)
                        ..getDoctorProfile(id: Doctor_id)
                        ..getDoctorSchedule(),
                        child: DoctorProfile(Doctor_id),
                      );
                     /* Future.delayed(const Duration(seconds: 2)).then((val){
                        DoctorCubit.get(context).setId(id: Doctor_id);
                        DoctorCubit.get(context).getDoctorProfile(id: Doctor_id);
                        DoctorCubit.get(context).getDoctorSchedule();
                      });
                      return DoctorProfile(Doctor_id);*/
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Patients_List',
                name: kPatientList,
                builder: (context, state) {
                  return const PatientsList();
                },
                routes: [
                  GoRoute(
                    path: 'Patient_profile/:Patient_id',
                    name: kPatientProfile,
                    builder: (context, state) {
                      int Patient_id=int.parse(state.pathParameters['Patient_id']!);
                      Future.delayed(const Duration(seconds: 2)).then((val){
                        PatientCubit.get(context).setId(id: Patient_id);
                        PatientCubit.get(context).getPatientProfile(id: Patient_id);
                      });
                      return PatientProfile(id: Patient_id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Laboratory',
                name: kLaboratory,
                builder: (context, state) {
                  return const LaboratoriesList();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Inbox',
                name: kInbox,
                builder: (context, state) {
                  return const Inbox();
                },
              ),
            ],
          )
        ],
      ),
/*      GoRoute(path: '/appointment', name: kAllAppointment, pageBuilder: (context, state){
        return const MaterialPage(child: AllAppointmentScreen());
      }),
      GoRoute(path: '/addAppointment', name: kAddAppointment, pageBuilder: (context, state){
        return const MaterialPage(child: TestAppointment());*/
      })
    ],
  );
}
