import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({
    super.key,
    required this.controller,
    required this.front,
    required this.back,
  });
  final FlipCardController controller;
  final Widget front;
  final Widget back;
  @override
  State<FlipCardWidget> createState() => FlipCardWidgetState();
}

class FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;
  Future flipCard() async {
    print(isFront);
    if (controller.isAnimating) return;
    isFront = !isFront;
    if (isFront) {
      await controller.reverse();
    } else {
      await controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    print("INIT STATE");
    widget.controller._state = this;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angle = controller.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontImage(angle.abs())
              ? widget.front
              : Transform(
                  transform: Matrix4.identity()..rotateY(pi),
                  alignment: Alignment.center,
                  child: widget.back,
                ),
        );
      },
    );
  }

  // Front : from 0 till 90 degrees and 270 till 360 degree
  // Back : from 90 till 270 degrees
  bool isFrontImage(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;
    return angle <= degrees90 || angle >= degrees270;
  }
}

class FlipCardController {
  FlipCardWidgetState? _state;
  Future flipCard() async => _state?.flipCard();
}
