import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/dio_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progress_state_button/progress_button.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo) : super(const AuthState.initial());
  final AuthRepository _repo;
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final pageController = PageController();
  ButtonState loginButtonState = ButtonState.idle;
  ButtonState otpButtonState = ButtonState.idle;
  String otpCode = '';
  Future<void> requestCode(BuildContext context) async {
    loginButtonState = ButtonState.loading;
    emit(const AuthState.requestCodeLoading());
    final response = await _repo.requestCode(
        phoneNumberController.text, passwordController.text);
    response.fold((error) {
      loginButtonState = ButtonState.idle;
      emit(AuthState.requestCodeError(error));
     // ToastBar.onNetworkFailure(context, networkException: error);
    }, (data) {
      loginButtonState = ButtonState.success;
      emit(const AuthState.requestCodeSuccess());
      /*ToastBar.onSuccess(
        context,
        message: 'the code has been sent successfully',
        title: "Success",
      );*/
    });
  }

  Future<void> verfiyCode(BuildContext context) async {
    otpButtonState = ButtonState.loading;
    emit(const AuthState.verfiyCodeLoading());
    final response =
        await _repo.verfiycode(phoneNumberController.text, otpCode);
    response.fold((error) {
      otpButtonState = ButtonState.fail;
      emit(AuthState.verfiyCodeError(error));
      // ToastBar.onNetworkFailure(context, networkException: error);
    }, (data) {
      otpButtonState = ButtonState.success;
      emit(const AuthState.verfiyCodeSuccess());
      SharedPrefrence.saveData(key:'token', value:data);
      DioHelper().addTokenInterceptor();
      /*ToastBar.onSuccess(
        context,
        message: "Welcome Back",
        title: 'Success',
      );*/
    });
  }
}
