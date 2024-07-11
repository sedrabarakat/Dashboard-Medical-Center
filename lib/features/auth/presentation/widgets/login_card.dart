import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_button.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    this.textColor = ColorsHelper.black,
    required this.phoneNumberController,
    required this.passwordController,
    required this.onPressed,
  });

  final Color textColor;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final Future<dynamic> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        AuthTextField(
          controller: passwordController,
          isPassword: true,
          label: 'Password',
          textColor: textColor,
        ),
        const SizedBox(
          height: AppSize.s24,
        ),
        DefaultLoadingButton(
          label: 'Sign in',
          onPressed: onPressed,
        )
        // SizedBox(
        //   width: double.infinity,
        //   child: AuthButton(
        //     label: "Sign in",
        //     onPressed: onPressed,
        //   ),
        // )
      ],
    );
  }
}
