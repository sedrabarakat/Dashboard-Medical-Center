import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
          icon: Icons.home,
          text: 'Home',
          onTap: () {
            navigationShell.goBranch(0,
                initialLocation: index == navigationShell.currentIndex);
          }),
      listTileWidget(
          index: index,
          spIndex: 1,
          text: 'Add Account',
          onTap: () {
            // cubit.changeSelctedTap(index: 1);
            navigationShell.goBranch(1,
                initialLocation: index == navigationShell.currentIndex);

            // context.go('/add_account');
          },
          icon: Icons.add),
      listTileWidget(
        index: index,
        spIndex: 2,
        text: 'Directors',
        icon: Icons.people_outline_rounded,
        onTap: () {
          // cubit.changeSelctedTap(index: 2);
          navigationShell.goBranch(2,
              initialLocation: index == navigationShell.currentIndex);

          // context.go('/Directors_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 3,
        text: 'Reseptions',
        icon: CupertinoIcons.person,
        onTap: () {
          // cubit.changeSelctedTap(index: 3);
          navigationShell.goBranch(3,
              initialLocation: index == navigationShell.currentIndex);
          // context.go('/Reseptions_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 4,
        text: 'Sections',
        icon: Icons.add_business,
        onTap: () {
          // cubit.changeSelctedTap(index: 4);
          navigationShell.goBranch(4,
              initialLocation: index == navigationShell.currentIndex);

          // context.go('/Sections_list');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 5,
        text: 'Doctors',
        icon: Icons.medical_services_rounded,
        onTap: () {
          // cubit.changeSelctedTap(index: 5);
          navigationShell.goBranch(5,
              initialLocation: index == navigationShell.currentIndex);

          // context.go('/Doctors_List');
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

          // cubit.changeSelctedTap(index: 6);
          // context.go('/Patients_List');
        },
      ),
      listTileWidget(
        index: index,
        spIndex: 7,
        text: 'Laboratory',
        icon: CupertinoIcons.lab_flask,
        onTap: () {
          navigationShell.goBranch(7,
              initialLocation: index == navigationShell.currentIndex);

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
          navigationShell.goBranch(8,
              initialLocation: index == navigationShell.currentIndex);

          // cubit.changeSelctedTap(index: 8);
          // context.go('/Inbox');
        },
      ),
    ],
  );
}
