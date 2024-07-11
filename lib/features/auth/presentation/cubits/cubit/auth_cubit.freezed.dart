// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RequestCodeLoadingImplCopyWith<$Res> {
  factory _$$RequestCodeLoadingImplCopyWith(_$RequestCodeLoadingImpl value,
          $Res Function(_$RequestCodeLoadingImpl) then) =
      __$$RequestCodeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestCodeLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RequestCodeLoadingImpl>
    implements _$$RequestCodeLoadingImplCopyWith<$Res> {
  __$$RequestCodeLoadingImplCopyWithImpl(_$RequestCodeLoadingImpl _value,
      $Res Function(_$RequestCodeLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestCodeLoadingImpl implements _RequestCodeLoading {
  const _$RequestCodeLoadingImpl();

  @override
  String toString() {
    return 'AuthState.requestCodeLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestCodeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return requestCodeLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return requestCodeLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeLoading != null) {
      return requestCodeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return requestCodeLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return requestCodeLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeLoading != null) {
      return requestCodeLoading(this);
    }
    return orElse();
  }
}

abstract class _RequestCodeLoading implements AuthState {
  const factory _RequestCodeLoading() = _$RequestCodeLoadingImpl;
}

/// @nodoc
abstract class _$$RequestCodeSuccessImplCopyWith<$Res> {
  factory _$$RequestCodeSuccessImplCopyWith(_$RequestCodeSuccessImpl value,
          $Res Function(_$RequestCodeSuccessImpl) then) =
      __$$RequestCodeSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestCodeSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RequestCodeSuccessImpl>
    implements _$$RequestCodeSuccessImplCopyWith<$Res> {
  __$$RequestCodeSuccessImplCopyWithImpl(_$RequestCodeSuccessImpl _value,
      $Res Function(_$RequestCodeSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestCodeSuccessImpl implements _RequestCodeSuccess {
  const _$RequestCodeSuccessImpl();

  @override
  String toString() {
    return 'AuthState.requestCodeSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestCodeSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return requestCodeSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return requestCodeSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeSuccess != null) {
      return requestCodeSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return requestCodeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return requestCodeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeSuccess != null) {
      return requestCodeSuccess(this);
    }
    return orElse();
  }
}

abstract class _RequestCodeSuccess implements AuthState {
  const factory _RequestCodeSuccess() = _$RequestCodeSuccessImpl;
}

/// @nodoc
abstract class _$$RequestCodeErrorImplCopyWith<$Res> {
  factory _$$RequestCodeErrorImplCopyWith(_$RequestCodeErrorImpl value,
          $Res Function(_$RequestCodeErrorImpl) then) =
      __$$RequestCodeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$RequestCodeErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RequestCodeErrorImpl>
    implements _$$RequestCodeErrorImplCopyWith<$Res> {
  __$$RequestCodeErrorImplCopyWithImpl(_$RequestCodeErrorImpl _value,
      $Res Function(_$RequestCodeErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RequestCodeErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$RequestCodeErrorImpl implements _RequestCodeError {
  const _$RequestCodeErrorImpl(this.error);

  @override
  final NetworkExceptions error;

  @override
  String toString() {
    return 'AuthState.requestCodeError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCodeErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCodeErrorImplCopyWith<_$RequestCodeErrorImpl> get copyWith =>
      __$$RequestCodeErrorImplCopyWithImpl<_$RequestCodeErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return requestCodeError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return requestCodeError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeError != null) {
      return requestCodeError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return requestCodeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return requestCodeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (requestCodeError != null) {
      return requestCodeError(this);
    }
    return orElse();
  }
}

abstract class _RequestCodeError implements AuthState {
  const factory _RequestCodeError(final NetworkExceptions error) =
      _$RequestCodeErrorImpl;

  NetworkExceptions get error;
  @JsonKey(ignore: true)
  _$$RequestCodeErrorImplCopyWith<_$RequestCodeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyCodeErrorImplCopyWith<$Res> {
  factory _$$VerifyCodeErrorImplCopyWith(_$VerifyCodeErrorImpl value,
          $Res Function(_$VerifyCodeErrorImpl) then) =
      __$$VerifyCodeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$VerifyCodeErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifyCodeErrorImpl>
    implements _$$VerifyCodeErrorImplCopyWith<$Res> {
  __$$VerifyCodeErrorImplCopyWithImpl(
      _$VerifyCodeErrorImpl _value, $Res Function(_$VerifyCodeErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$VerifyCodeErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$VerifyCodeErrorImpl implements _VerifyCodeError {
  const _$VerifyCodeErrorImpl(this.error);

  @override
  final NetworkExceptions error;

  @override
  String toString() {
    return 'AuthState.verfiyCodeError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeErrorImplCopyWith<_$VerifyCodeErrorImpl> get copyWith =>
      __$$VerifyCodeErrorImplCopyWithImpl<_$VerifyCodeErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return verfiyCodeError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return verfiyCodeError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (verfiyCodeError != null) {
      return verfiyCodeError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return verfiyCodeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return verfiyCodeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (verfiyCodeError != null) {
      return verfiyCodeError(this);
    }
    return orElse();
  }
}

abstract class _VerifyCodeError implements AuthState {
  const factory _VerifyCodeError(final NetworkExceptions error) =
      _$VerifyCodeErrorImpl;

  NetworkExceptions get error;
  @JsonKey(ignore: true)
  _$$VerifyCodeErrorImplCopyWith<_$VerifyCodeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyCodeSuccessImplCopyWith<$Res> {
  factory _$$VerifyCodeSuccessImplCopyWith(_$VerifyCodeSuccessImpl value,
          $Res Function(_$VerifyCodeSuccessImpl) then) =
      __$$VerifyCodeSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyCodeSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifyCodeSuccessImpl>
    implements _$$VerifyCodeSuccessImplCopyWith<$Res> {
  __$$VerifyCodeSuccessImplCopyWithImpl(_$VerifyCodeSuccessImpl _value,
      $Res Function(_$VerifyCodeSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyCodeSuccessImpl implements _VerifyCodeSuccess {
  const _$VerifyCodeSuccessImpl();

  @override
  String toString() {
    return 'AuthState.verfiyCodeSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyCodeSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestCodeLoading,
    required TResult Function() requestCodeSuccess,
    required TResult Function(NetworkExceptions error) requestCodeError,
    required TResult Function(NetworkExceptions error) verfiyCodeError,
    required TResult Function() verfiyCodeSuccess,
  }) {
    return verfiyCodeSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestCodeLoading,
    TResult? Function()? requestCodeSuccess,
    TResult? Function(NetworkExceptions error)? requestCodeError,
    TResult? Function(NetworkExceptions error)? verfiyCodeError,
    TResult? Function()? verfiyCodeSuccess,
  }) {
    return verfiyCodeSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestCodeLoading,
    TResult Function()? requestCodeSuccess,
    TResult Function(NetworkExceptions error)? requestCodeError,
    TResult Function(NetworkExceptions error)? verfiyCodeError,
    TResult Function()? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (verfiyCodeSuccess != null) {
      return verfiyCodeSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RequestCodeLoading value) requestCodeLoading,
    required TResult Function(_RequestCodeSuccess value) requestCodeSuccess,
    required TResult Function(_RequestCodeError value) requestCodeError,
    required TResult Function(_VerifyCodeError value) verfiyCodeError,
    required TResult Function(_VerifyCodeSuccess value) verfiyCodeSuccess,
  }) {
    return verfiyCodeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult? Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult? Function(_RequestCodeError value)? requestCodeError,
    TResult? Function(_VerifyCodeError value)? verfiyCodeError,
    TResult? Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
  }) {
    return verfiyCodeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RequestCodeLoading value)? requestCodeLoading,
    TResult Function(_RequestCodeSuccess value)? requestCodeSuccess,
    TResult Function(_RequestCodeError value)? requestCodeError,
    TResult Function(_VerifyCodeError value)? verfiyCodeError,
    TResult Function(_VerifyCodeSuccess value)? verfiyCodeSuccess,
    required TResult orElse(),
  }) {
    if (verfiyCodeSuccess != null) {
      return verfiyCodeSuccess(this);
    }
    return orElse();
  }
}

abstract class _VerifyCodeSuccess implements AuthState {
  const factory _VerifyCodeSuccess() = _$VerifyCodeSuccessImpl;
}
