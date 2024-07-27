import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/validator_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/count_down_timer.dart';
import 'package:dashboad/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_field.dart';
import 'package:dashboad/features/auth/presentation/widgets/custom_state_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginCard extends StatelessWidget {
  LoginCard({
    super.key,
    this.textColor = Colors.black,
    required this.phoneNumberController,
    required this.passwordController,
    required this.onPressed,
    required this.buttonCurrentState,
  });

  final Color textColor;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final FocusNode keyboardFocusNode = FocusNode();
  final Future<dynamic> Function()? onPressed;
  final ButtonState buttonCurrentState;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: keyboardFocusNode,
      onKeyEvent: (event) {
        // when enter is pressed call the onPressed Function
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          if (formKey.currentState!.validate()) {
            onPressed!();
          }
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back!",
              style: StyleManager.fontBold32.copyWith(
                color: textColor,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'Sign in to continue',
              style: StyleManager.fontregular14,
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            AuthTextField(
              label: "Phone Number",
              hintText: 'ex: 09xxxxxxxx',
              controller: phoneNumberController,
              textColor: textColor,
              validator: (value) =>
                  ValidatorManager.instance.validatePhone(value ?? ''),
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            AuthTextField(
              controller: passwordController,
              isPassword: true,
              label: 'Password',
              textColor: textColor,
              validator: (value) =>
                  ValidatorManager.instance.validatePassword(value ?? ''),
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            CustomStateButton(
              label: 'Sign in',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onPressed!();
                } else {}
              },
              currentState: buttonCurrentState,
            ),
          ],
        ),
      ),
    );
  }
}
