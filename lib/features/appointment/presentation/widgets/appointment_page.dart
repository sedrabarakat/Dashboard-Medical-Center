import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../core/helpers/dimensions_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../cubit/appointment_state.dart';
import 'appointment_card.dart';

Widget buildLoadingState() {
  return Center(child: Lottie.asset(
    'assets/animation/LoadingPatient.json',
    width: 200,
    height: 200,
    //  fit: BoxFit.cover,
  ));
}

Widget buildErrorState(GetAppointmentErrorState state) {
  return Center(
    child: Text(
      NetworkExceptions.getErrorMessage(state.message as NetworkExceptions?),
      style: StyleManager.fontRegular20.copyWith(color: Colors.red),
    ),
  );
}

Widget buildHeader(BuildContext context) {
  return Row(
    children: [
      Image.asset(
        'assets/images/2.jpg',
        height: DimensionsHelper.heightPercentage(context, 20),
      ),
      const SizedBox(width: AppSize.s50),
      Text(
        'Appointments and Schedule:',
        style: StyleManager.font30Bold_Lobster,
      ),
    ],
  );
}

Widget buildAppointmentGrid(
    BuildContext context, GetAppointmentSuccessState state) {
  return Flexible(
    fit: FlexFit.loose,
    child: AnimationLimiter(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          state.appointments.length,
              (index) => AnimationConfiguration.staggeredGrid(
            duration: const Duration(milliseconds: 2000),
            position: index,
            columnCount: 2,
            child: FadeInAnimation(
              child:  AppointmentCard(
                appointment: state.appointments[index],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
