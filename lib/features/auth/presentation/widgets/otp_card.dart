import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpCard extends StatelessWidget {
  const OtpCard({
    super.key,
    this.textColor = Colors.black54,
    required this.onPressed,
    required this.onCompleted,
  });

  final Color textColor;
  final Future<dynamic> Function()? onPressed;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            color: ColorsHelper.teal,
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
                color: ColorsHelper.teal,
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
        DefaultLoadingButton(
          label: 'Send Code',
          onPressed: onPressed,
        )
        // SizedBox(
        //   width: double.infinity,
        //   child: AuthButton(
        //     label: 'Send Code',
        //     onPressed: onPressed,
        //   ),
        // )
      ],
    );
  }
}
