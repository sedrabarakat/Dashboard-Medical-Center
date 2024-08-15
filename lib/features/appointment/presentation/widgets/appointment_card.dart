
import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';
import '../../data/models/appointment_model.dart';
import 'appointment_details.dart';

class AppointmentCard extends StatefulWidget {
  final AppointmentModel appointment;

  const AppointmentCard({Key? key, required this.appointment}) : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(1.15);
    final transformValue = isHovered ? hoverTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Transform(
        transform: transformValue,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(AppPadding.p10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/appointment_background1.jpg',
                    fit: BoxFit.fill,
                  ),
                  AppointmentDetails(appointment: widget.appointment),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}