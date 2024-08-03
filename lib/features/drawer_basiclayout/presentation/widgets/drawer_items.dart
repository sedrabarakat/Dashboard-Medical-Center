import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubits/basic_states.dart';
import 'list_tile.dart';

Widget drawerList({required StatefulNavigationShell navigationShell}) {
  int index = navigationShell.currentIndex;
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.all(10.r),
    children: [
      listTileWidget(
          index: index,
          spIndex: 0,
          text: 'Add Account',
          onTap: () {
            // cubit.changeSelctedTap(index: 1);
            navigationShell.goBranch(0);

            // context.go('/add_account');
          },
          icon: Icons.add),
      listTileWidget(
        index: index,
        spIndex: 1,
        text: 'Directors',
        icon: Icons.people_outline_rounded,
        onTap: () {
          // cubit.changeSelctedTap(index: 2);
          navigationShell.goBranch(1);

          // context.go('/Directors_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 2,
        text: 'Reseptions',
        icon: CupertinoIcons.person,
        onTap: () {
          // cubit.changeSelctedTap(index: 3);
          navigationShell.goBranch(2);
          // context.go('/Reseptions_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 3,
        text: 'Sections',
        icon: Icons.add_business,
        onTap: () {
          // cubit.changeSelctedTap(index: 4);
          navigationShell.goBranch(3,
              initialLocation: index == navigationShell.currentIndex);

          // context.go('/Sections_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 4,
        text: 'Doctors',
        icon: Icons.medical_services_rounded,
        onTap: () {
          // cubit.changeSelctedTap(index: 5);
          navigationShell.goBranch(4);

          // context.go('/Doctors_List');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 5,
        text: 'Patients',
        icon: Icons.medication_liquid,
        onTap: () {
          navigationShell.goBranch(5);

          // cubit.changeSelctedTap(index: 6);
          // context.go('/Patients_List');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 6,
        text: 'Laboratory',
        icon: CupertinoIcons.lab_flask,
        onTap: () {
          navigationShell.goBranch(6);

          // cubit.changeSelctedTap(index: 7);
          // context.go('/Laboratory');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 8,
        text: 'Inbox',
        icon: Icons.forward_to_inbox,
        onTap: () {
          navigationShell.goBranch(7);

          // cubit.changeSelctedTap(index: 8);
          // context.go('/Inbox');
        },
      ),
    ],
  );
}
