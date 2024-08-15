import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/values_manager.dart';
import '../widgets/appointment_page.dart';

class AllAppointmentScreen extends StatelessWidget {
  const AllAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(getIt())..getAppointment(),
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
          buildWhen: (previous, current) =>
              current is GetAppointmentLoadingState ||
              current is GetAppointmentSuccessState ||
              current is GetAppointmentErrorState,
          builder: (context, state) {
            if (state is GetAppointmentLoadingState) {
              return buildLoadingState();
            } else if (state is GetAppointmentErrorState) {
              return buildErrorState(state);
            } else if (state is GetAppointmentSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p30),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsHelper.blueLight),
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                  child: Column(
                    children: [
                      buildHeader(context),
                      buildAppointmentGrid(context, state),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}



