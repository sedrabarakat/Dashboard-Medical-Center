import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubits/basic_states.dart';
import 'list_tile.dart';

Widget receptionDrawerList({required BuildContext context}) {
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
              text: 'Doctors',
              icon: Icons.medical_services_rounded,
              onTap: () {
                cubit.changeSelctedTap(index: 1);
                context.go('/Doctors_List');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 2,
              text: 'Patients',
              icon: Icons.medication_liquid,
              onTap: () {
                cubit.changeSelctedTap(index:2);
                context.go('/Patients_List');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 3,
              icon: Icons.book_online,
              text: 'Session',
              onTap: () {
                cubit.changeSelctedTap(index: 3);
                context.go('/session');
              },
            ),
            listTileWidget(
              index: index,
              spIndex: 4,
              icon: Icons.book_online,
              text: 'Appointments',
              onTap: () {
                cubit.changeSelctedTap(index: 4);
                context.go('/appointment');
              },
            ),

          ]);
    },
  );
}
