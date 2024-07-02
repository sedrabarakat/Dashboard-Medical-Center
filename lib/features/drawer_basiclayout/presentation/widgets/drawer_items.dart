import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubits/basic_states.dart';
import 'list_tile.dart';

Widget Drawer_List({required BuildContext context}) {
  return BlocConsumer<BasicCubit, BasicStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
      BasicCubit cubit = BasicCubit.get(context);
      int index = cubit.Selected_Index;
      return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.r),
          children: [
            listTile_Widget(
                index: index,
                sp_index: 1,
                text: 'Add Account',
                onTap: () {
                  cubit.Change_Selected_Tap(index: 1);
                  context.go('/add_account');
                },
                icon: Icons.add),
            listTile_Widget(
              index: index,
              sp_index: 2,
              text: 'Directors',
              icon: Icons.people_outline_rounded,
              onTap: () {
                cubit.Change_Selected_Tap(index: 2);
                context.go('/Directors_list');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 3,
              text: 'Reseptions',
              icon: CupertinoIcons.person,
              onTap: () {
                cubit.Change_Selected_Tap(index: 3);
                context.go('/Reseptions_list');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 4,
              text: 'Sections',
              icon: Icons.add_business,
              onTap: () {
                cubit.Change_Selected_Tap(index: 4);
                context.go('/Sections_list');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 5,
              text: 'Doctors',
              icon: Icons.medical_services_rounded,
              onTap: () {
                cubit.Change_Selected_Tap(index: 5);
                context.go('/Doctors_List');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 6,
              text: 'Patients',
              icon: Icons.medication_liquid,
              onTap: () {
                cubit.Change_Selected_Tap(index: 6);
                context.go('/Patients_List');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 7,
              text: 'Laboratory',
              icon: CupertinoIcons.lab_flask,
              onTap: () {
                cubit.Change_Selected_Tap(index: 7);
                context.go('/Laboratory');
              },
            ),
            listTile_Widget(
              index: index,
              sp_index: 8,
              text: 'Inbox',
              icon: Icons.forward_to_inbox,
              onTap: () {
                cubit.Change_Selected_Tap(index: 8);
                context.go('/Inbox');
              },
            ),
          ]);
    },
  );
}
