import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubits/basic_states.dart';
import 'list_tile.dart';

Widget drawerList({required BuildContext context}) {
  return BlocConsumer<BasicCubit, BasicStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
      BasicCubit cubit = BasicCubit.get(context);
      int index = cubit.selectedIndex;
      return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.r),
          children: [
            listTileWidget(
                index: index,
                spIndex: 1,
                text: 'Add Account',
                onTap: () {
                  cubit.changeSelctedTap(index: 1);
                  context.go('/add_account');
                },
                icon: Icons.add),
            listTileWidget(
              index: index,
              spIndex: 2,
              text: 'Directors',
              icon: Icons.people_outline_rounded,
              onTap: () {
                cubit.changeSelctedTap(index: 2);
                context.go('/Directors_list');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 3,
              text: 'Reseptions',
              icon: CupertinoIcons.person,
              onTap: () {
                cubit.changeSelctedTap(index: 3);
                context.go('/Reseptions_list');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 4,
              text: 'Sections',
              icon: Icons.add_business,
              onTap: () {
                cubit.changeSelctedTap(index: 4);
                context.go('/Sections_list');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 5,
              text: 'Doctors',
              icon: Icons.medical_services_rounded,
              onTap: () {
                cubit.changeSelctedTap(index: 5);
                context.go('/Doctors_List');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 6,
              text: 'Patients',
              icon: Icons.medication_liquid,
              onTap: () {
                cubit.changeSelctedTap(index: 6);
                context.go('/Patients_List');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 7,
              text: 'Laboratory',
              icon: CupertinoIcons.lab_flask,
              onTap: () {
                cubit.changeSelctedTap(index: 7);
                context.go('/Laboratory');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 8,
              text: 'Inbox',
              icon: Icons.forward_to_inbox,
              onTap: () {
                cubit.changeSelctedTap(index: 8);
                context.go('/Inbox');
              },
            ),
          ]);
    },
  );
}



