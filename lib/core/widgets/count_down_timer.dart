import 'dart:async';

import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    required this.label,
    required this.onTimeFinished,
    required this.onSendAgainPressed,
    required this.duration,
    this.labelColor = Colors.black,
  });
  final String label;
  final Color labelColor;
  final Duration duration;
  final void Function() onTimeFinished;
  final Future<void> Function()? onSendAgainPressed;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  bool finished = false;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_duration.inSeconds <= 0) {
          setState(() {
            finished = true;
          });
          widget.onTimeFinished();
          _timer.cancel();
        } else {
          setState(() {
            _duration = _duration - const Duration(seconds: 1);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = formateTime(_duration);
    return finished
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: StyleManager.fontregular14.copyWith(
                  color: widget.labelColor,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await widget.onSendAgainPressed!();
                  finished = false;
                  setState(() {
                    _duration = widget.duration;
                  });
                  _startTimer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  overlayColor: Colors.teal.withOpacity(.2),
                ),
                child: Text(
                  "Send again",
                  style: StyleManager.fontregular14.copyWith(
                    color: ColorsHelper.teal,
                  ),
                ),
              ),
            ],
          )
        : Text(
            '${widget.label} send again after : $formattedTime',
            style: StyleManager.fontregular14.copyWith(
              color: widget.labelColor,
            ),
          );
  }

  String formateTime(Duration duration) {
    if (duration.inHours > 0) {
      return DateFormat('HH:mm:ss').format(DateTime(0).add(duration));
    }
    return DateFormat('mm:ss').format(DateTime(0).add(duration));
  }
}
