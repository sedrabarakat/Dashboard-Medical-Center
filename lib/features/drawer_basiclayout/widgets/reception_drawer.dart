import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/drop_down.dart';

import 'list_tile.dart';

Widget receptionDrawerList({required StatefulNavigationShell navigationShell}) {
  int index = navigationShell.currentIndex;
      return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.r),
          children: [
            listTileWidget(
              index: index,
              spIndex: 1,
              text: 'Doctors',
              icon: Icons.medical_services_rounded,
              onTap: () {
                navigationShell.goBranch(1);
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 2,
              text: 'Patients',
              icon: Icons.medication_liquid,
              onTap: () {
                navigationShell.goBranch(2);
              },
            ),
            ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              leading: Icon(
                Icons.book_online,
                color: (index == 3) ? Colors.white : ColorsHelper.blueDark,
              ),
              title: Dropdown(
                dropdownItems: const [
                  'View All Appointments',
                  'Add New Appointment'
                ],
                OnChanged: (value) {
                  if (value == 'View All Appointments') {
                 //   context.go('/appointment');
                  } else if (value == 'Add New Appointment') {
                   // context.go('/addAppointment');
                  }
                },
                hintText: 'Appointments',
                borderStyle: StyleManager.Border_round40,
                fillColor: ColorsHelper.blueLightest,
              ),
              tileColor: (index == 3) ? ColorsHelper.blueDark : null,
              onTap: () {
                //cubit.changeSelctedTap(index: 3);
              },
            ),
          ]);
}
