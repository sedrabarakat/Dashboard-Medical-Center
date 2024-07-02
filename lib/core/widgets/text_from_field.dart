import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFiledDash extends StatelessWidget {
  TextFiledDash(
      {super.key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.maxLine = 1,
      this.minLine = 1,
      this.textFieldHintColor = Colors.white,
      this.helperText,
      this.suffixPressed,
      required this.radius});

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final String? helperText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;

  final Color? textFieldHintColor;
  final double radius;
  bool isBorder = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      minLines: minLine,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator ??
          (String? val) {
            if (val!.trim().isEmpty) return 'Filed is required*';
            return null;
          },
      onChanged: onChanged,
      onTap: onTap,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          helperMaxLines: 2,
          helperText: helperText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
          prefixIcon: iconData == null
              ? null
              : Icon(
                  iconData,
                ),
          suffixIcon: suffixIcon
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    obscureText ? Icons.lock_open : Icons.lock_outline,
                    color: !obscureText
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ))
              : null,
          hintText: hintText),
    );
  }
}
