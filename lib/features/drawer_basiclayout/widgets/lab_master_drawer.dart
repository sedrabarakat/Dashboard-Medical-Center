import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'list_tile.dart';

Widget labMasterDrawer({required StatefulNavigationShell navigationShell}) {
  int index = navigationShell.currentIndex;
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.all(10.r),
    children: [
      listTileWidget(
          index: index,
          spIndex: 11,
          text: 'patient queue',
          onTap: () {
            // cubit.changeSelctedTap(index: 1);
            navigationShell.goBranch(11,
                initialLocation: index == navigationShell.currentIndex);

            // context.go('/add_account');
          },
          icon: Icons.person),
    ],
  );
}
