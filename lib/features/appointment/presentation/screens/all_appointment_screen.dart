import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/screens/baselayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';

class AllAppointmentScreen extends StatelessWidget {
  const AllAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(getIt())..getAppointment(),
      child: BaseLayout(
        child: Column(
          children: [
            BlocBuilder<AppointmentCubit, AppointmentState>(
                buildWhen: (previous, current) {
              if (current is GetAppointmentLoadingState ||
                  current is GetAppointmentSuccessState ||
                  current is GetAppointmentErrorState) {
                return true;
              }
              return false;
            }, builder: (context, state) {
              final items = [
                'https://via.placeholder.com/640x480.png/0077ee?text=voluptatibus',
                'https://via.placeholder.com/640x480.png/0077ee?text=voluptatibus',
                'https://via.placeholder.com/640x480.png/0077ee?text=voluptatibus',
                'https://via.placeholder.com/640x480.png/0077ee?text=voluptatibus',
                'https://via.placeholder.com/640x480.png/0077ee?text=voluptatibus',
              ];
              if (state is GetAppointmentErrorState) {
                return Text(NetworkExceptions.getErrorMessage(
                    state.message as NetworkExceptions?));
              } else if (state is GetAppointmentLoadingState) {
                debugPrint('getAppointment loading state');
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAppointmentSuccessState) {
                debugPrint('Get Appointment Success State');
                return SingleChildScrollView(
                    child: MasonryView(
                  listOfItem: items,
                  numberOfColumn: 3,
                  itemBuilder: (item) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          item,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ), //Image.asset(item),
                      ),
                    );
                  },
                ));
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
