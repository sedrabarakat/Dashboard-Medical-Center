import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/back_request_card.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/front_request_card.dart';
import 'package:flutter/material.dart';

var fController = FlipCardController();
var controllers = List.generate(20, (index) => FlipCardController());

class LabMasterPatientQueue extends StatelessWidget {
  const LabMasterPatientQueue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(
            AppPadding.p30,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisExtent: 210,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FlipCardWidget(
                controller: controllers[index],
                front: FrontRequestCard(
                  controller: controllers[index],
                ),
                back: BackRequestCard(
                  controller: controllers[index],
                ),
              );
            },
            itemCount: 20,
          )),
    );
  }
}
