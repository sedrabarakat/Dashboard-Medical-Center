import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:flutter/material.dart';

class FrontRequestCard extends StatefulWidget {
  const FrontRequestCard({
    super.key,
    required this.controller,
    required this.date,
    required this.patientName,
    required this.serviceName,
    required this.makeItDoneOnPressed,
    required this.makeItFailOnPressed,
    this.status,
    this.description,
  });
  final FlipCardController controller;
  final String patientName;
  final String date;
  final String serviceName;
  final String? status;
  final String? description;
  final void Function()? makeItDoneOnPressed;
  final void Function()? makeItFailOnPressed;
  @override
  State<FrontRequestCard> createState() => _FrontRequestCardState();
}

class _FrontRequestCardState extends State<FrontRequestCard> {
  double opacityLevel = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorsHelper.darkGrey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 18,
                      color: ColorsHelper.darkGrey,
                    ),
                    onPressed: () {
                      hideTheMenu();
                    },
                  ),
                ],
              ),
              Text(
                widget.patientName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsHelper.darkGrey,
                ),
              ),
              Text(
                widget.description != null
                    ? widget.description!
                    : 'No description',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorsHelper.darkGrey,
                ),
              ),
              Divider(
                color: ColorsHelper.grey800,
              ),
              Row(
                children: [
                  Text(
                    widget.serviceName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorsHelper.darkGrey,
                    ),
                  ),
                  const Spacer(),
                  widget.status != null
                      ? Container(
                          decoration: BoxDecoration(
                            color: widget.status == 'pending'
                                ? Colors.orangeAccent
                                : widget.status == 'done'
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            widget.status!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 35,
          child: AnimatedOpacity(
            opacity: opacityLevel,
            onEnd: () {
              if (opacityLevel == 0) {
                setState(() {
                  isVisible = false;
                });
              }
            },
            duration: const Duration(milliseconds: 200),
            child: Visibility(
              visible: isVisible,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsHelper.lightGry,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: ColorsHelper.darkGrey,
                        fixedSize: const Size(100, 20),
                      ),
                      onPressed: () async {
                        await widget.controller.flipCard();
                      },
                      child: Text(
                        "Upload File",
                        style: TextStyle(
                            color: ColorsHelper.darkGrey, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        overlayColor: ColorsHelper.darkGrey,
                        fixedSize: const Size(100, 20),
                      ),
                      child: Text(
                        "Doctor Profile",
                        style: TextStyle(
                            color: ColorsHelper.darkGrey, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        hideTheMenu();
                        widget.makeItDoneOnPressed!();
                      },
                      style: TextButton.styleFrom(
                        overlayColor: ColorsHelper.darkGrey,
                        fixedSize: const Size(100, 20),
                      ),
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: ColorsHelper.darkGrey, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        hideTheMenu();
                        widget.makeItFailOnPressed!();
                      },
                      style: TextButton.styleFrom(
                        overlayColor: ColorsHelper.darkGrey,
                        fixedSize: const Size(100, 20),
                      ),
                      child: Text(
                        "Fail",
                        style: TextStyle(
                            color: ColorsHelper.darkGrey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void hideTheMenu() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      if (opacityLevel == 1) {
        isVisible = true;
      }
    });
  }
}
