import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.hintText,
    this.textColor = Colors.black54,
  });
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Color textColor;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _passwordVisible = true;
  Color _suffixIconColor = ColorsHelper.lightGry;
  final FocusNode _focusNode = FocusScopeNode();
  @override
  void initState() {
    widget.isPassword
        ? _focusNode.addListener(
            () {
              setState(
                () {
                  _focusNode.hasFocus
                      ? _suffixIconColor = ColorsHelper.teal
                      : _suffixIconColor = ColorsHelper.lightGry;
                },
              );
            },
          )
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: StyleManager.fontregular14.copyWith(
            color: widget.textColor,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        TextFormField(
          focusNode: _focusNode,
          obscureText: widget.isPassword ? _passwordVisible : false,
          controller: widget.controller,
          cursorColor: ColorsHelper.tealDark,
          style: StyleManager.fontregular14.copyWith(
            color: widget.textColor,
          ),
          decoration: InputDecoration(
            suffixIconColor: _suffixIconColor,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          _passwordVisible = !_passwordVisible;
                        },
                      );
                    },
                    iconSize: AppSize.s20,
                    icon: _passwordVisible
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined))
                : null,
            hintText: widget.hintText,
            hintStyle: StyleManager.fontRegular12,
            focusedBorder: _buildBorder(ColorsHelper.tealLightDark),
            enabledBorder: _buildBorder(ColorsHelper.lightGry),
            errorBorder: _buildBorder(Colors.red),
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }
}
