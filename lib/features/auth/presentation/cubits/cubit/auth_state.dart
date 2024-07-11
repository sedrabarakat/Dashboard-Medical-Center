part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.requestCodeLoading() = _RequestCodeLoading;
  const factory AuthState.requestCodeSuccess() = _RequestCodeSuccess;
  const factory AuthState.requestCodeError(NetworkExceptions error) =
      _RequestCodeError;
  const factory AuthState.verfiyCodeError(NetworkExceptions error) =
      _VerifyCodeError;
  const factory AuthState.verfiyCodeSuccess() = _VerifyCodeSuccess;
}
