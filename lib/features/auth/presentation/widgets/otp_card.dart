import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/count_down_timer.dart';
import 'package:dashboad/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:dashboad/features/auth/presentation/widgets/custom_state_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:progress_state_button/progress_button.dart';

class OtpCard extends StatelessWidget {
  OtpCard({
    super.key,
    this.textColor = Colors.black54,
    required this.onPressed,
    required this.onCompleted,
    required this.buttonCurrentState,
    required this.timerDuration,
  });

  final Color textColor;
  final Duration timerDuration;
  final Function()? onPressed;
  final void Function(String)? onCompleted;
  final ButtonState buttonCurrentState;
  final FocusNode keyboardFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: keyboardFocusNode,
      // When enter pressed call the onPressed Function
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          onPressed!();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Verification Code!",
            style: StyleManager.fontBold32.copyWith(
              color: textColor,
            ),
          ),
          const SizedBox(height: AppSize.s10),
          Text(
            'We sent it to 09xxxxxxxx',
            style: StyleManager.fontregular14,
          ),
          const SizedBox(
            height: AppSize.s60,
          ),
          Pinput(
            length: 6,
            onCompleted: onCompleted,
            cursor: Container(
              height: 15,
              width: 1,
              color: ColorsHelper.blue,
            ),
            defaultPinTheme: PinTheme(
              width: 56,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: ColorsHelper.lightGry,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: StyleManager.fontregular14.copyWith(
                color: textColor,
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 56,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: ColorsHelper.blue,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: StyleManager.fontregular14.copyWith(
                color: textColor,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          CustomStateButton(
            label: 'Sign in',
            onPressed: onPressed,
            currentState: buttonCurrentState,
          ),
          const SizedBox(
            height: 15,
          ),
          CountDownTimer(
            label: 'Didn\'t recive a code ? ',
            labelColor: textColor,
            onTimeFinished: () {},
            duration: timerDuration,
            onSendAgainPressed: () async {
              await BlocProvider.of<AuthCubit>(context).requestCode(context);
            },
          ),
        ],
      ),
    );
  }
}
