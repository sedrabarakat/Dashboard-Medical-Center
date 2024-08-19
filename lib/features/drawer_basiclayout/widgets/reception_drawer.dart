import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/drop_down.dart';

import 'list_tile.dart';

Widget receptionDrawerList(
    {required StatefulNavigationShell navigationShell,
    required BuildContext context}) {
  int index = navigationShell.currentIndex;
  return ListView(shrinkWrap: true, padding: EdgeInsets.all(10.r), children: [
    listTileWidget(
        index: index,
        spIndex: 0,
        icon: Icons.home,
        text: 'Home',
        onTap: () {
          navigationShell.goBranch(0,
              initialLocation: index == navigationShell.currentIndex);
        }),
    listTileWidget(
        index: index,
        spIndex: 1,
        text: 'Add Patient',
        onTap: () {
          // cubit.changeSelctedTap(index: 1);
          navigationShell.goBranch(1,
              initialLocation: index == navigationShell.currentIndex);

          // context.go('/add_account');
        },
        icon: Icons.add),
    listTileWidget(
      index: index,
      spIndex: 5,
      text: 'Doctors',
      icon: Icons.medical_services_rounded,
      onTap: () {
        navigationShell.goBranch(5,
            initialLocation: index == navigationShell.currentIndex);
      },
    ),
    listTileWidget(
      index: index,
      spIndex: 6,
      text: 'Patients',
      icon: Icons.medication_liquid,
      onTap: () {
        navigationShell.goBranch(6,
            initialLocation: index == navigationShell.currentIndex);
      },
    ),
    ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      leading: Icon(
        Icons.book_online,
        color: (index == 4) ? Colors.white : ColorsHelper.blueDark,
      ),
      title: Dropdown(
        dropdownItems: const ['View All Appointments', 'Add New Appointment'],
        onChanged: (value) {
          if (value == 'View All Appointments') {
            context.go('/appointment');
          } else if (value == 'Add New Appointment') {
            context.go('/addAppointment');
          }
        },
        hintText: 'Appointments',
        borderStyle: StyleManager.Border_round40,
        fillColor: ColorsHelper.blueLightest,
      ),
      tileColor: (index == 4) ? ColorsHelper.blueDark : null,
      onTap: () {
        //cubit.changeSelctedTap(index: 3);
      },
    ),
  ]);
}
