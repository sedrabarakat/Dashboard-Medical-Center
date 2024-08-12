import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';

import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackRequestCard extends StatelessWidget {
  const BackRequestCard({super.key, required this.controller});
  final FlipCardController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: ColorsHelper.test.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorsHelper.test,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "Select your file",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorsHelper.darkGrey,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  await controller.flipCard();
                },
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 18,
                ),
              )
            ],
          ),
          Expanded(
            child: DottedBorder(
              padding: const EdgeInsets.all(10),
              stackFit: StackFit.expand,
              color: ColorsHelper.darkGrey,
              child: SvgPicture.asset(
                AssetsManager.uploadFileImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
