// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'director_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DirectorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectorStateCopyWith<$Res> {
  factory $DirectorStateCopyWith(
          DirectorState value, $Res Function(DirectorState) then) =
      _$DirectorStateCopyWithImpl<$Res, DirectorState>;
}

/// @nodoc
class _$DirectorStateCopyWithImpl<$Res, $Val extends DirectorState>
    implements $DirectorStateCopyWith<$Res> {
  _$DirectorStateCopyWithImpl(this._value, this._then);

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
    extends _$DirectorStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DirectorState.initial()';
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
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
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
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DirectorState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DirectorsLoadingImplCopyWith<$Res> {
  factory _$$DirectorsLoadingImplCopyWith(_$DirectorsLoadingImpl value,
          $Res Function(_$DirectorsLoadingImpl) then) =
      __$$DirectorsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DirectorsLoadingImplCopyWithImpl<$Res>
    extends _$DirectorStateCopyWithImpl<$Res, _$DirectorsLoadingImpl>
    implements _$$DirectorsLoadingImplCopyWith<$Res> {
  __$$DirectorsLoadingImplCopyWithImpl(_$DirectorsLoadingImpl _value,
      $Res Function(_$DirectorsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DirectorsLoadingImpl implements _DirectorsLoading {
  const _$DirectorsLoadingImpl();

  @override
  String toString() {
    return 'DirectorState.directorsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DirectorsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return directorsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return directorsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsLoading != null) {
      return directorsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return directorsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return directorsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsLoading != null) {
      return directorsLoading(this);
    }
    return orElse();
  }
}

abstract class _DirectorsLoading implements DirectorState {
  const factory _DirectorsLoading() = _$DirectorsLoadingImpl;
}

/// @nodoc
abstract class _$$DirectorsSuccessImplCopyWith<$Res> {
  factory _$$DirectorsSuccessImplCopyWith(_$DirectorsSuccessImpl value,
          $Res Function(_$DirectorsSuccessImpl) then) =
      __$$DirectorsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserModel> directors});
}

/// @nodoc
class __$$DirectorsSuccessImplCopyWithImpl<$Res>
    extends _$DirectorStateCopyWithImpl<$Res, _$DirectorsSuccessImpl>
    implements _$$DirectorsSuccessImplCopyWith<$Res> {
  __$$DirectorsSuccessImplCopyWithImpl(_$DirectorsSuccessImpl _value,
      $Res Function(_$DirectorsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directors = null,
  }) {
    return _then(_$DirectorsSuccessImpl(
      null == directors
          ? _value._directors
          : directors // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$DirectorsSuccessImpl implements _DirectorsSuccess {
  const _$DirectorsSuccessImpl(final List<UserModel> directors)
      : _directors = directors;

  final List<UserModel> _directors;
  @override
  List<UserModel> get directors {
    if (_directors is EqualUnmodifiableListView) return _directors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directors);
  }

  @override
  String toString() {
    return 'DirectorState.directorsSuccess(directors: $directors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectorsSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._directors, _directors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_directors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectorsSuccessImplCopyWith<_$DirectorsSuccessImpl> get copyWith =>
      __$$DirectorsSuccessImplCopyWithImpl<_$DirectorsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return directorsSuccess(directors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return directorsSuccess?.call(directors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsSuccess != null) {
      return directorsSuccess(directors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return directorsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return directorsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsSuccess != null) {
      return directorsSuccess(this);
    }
    return orElse();
  }
}

abstract class _DirectorsSuccess implements DirectorState {
  const factory _DirectorsSuccess(final List<UserModel> directors) =
      _$DirectorsSuccessImpl;

  List<UserModel> get directors;
  @JsonKey(ignore: true)
  _$$DirectorsSuccessImplCopyWith<_$DirectorsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DirectorsFailureImplCopyWith<$Res> {
  factory _$$DirectorsFailureImplCopyWith(_$DirectorsFailureImpl value,
          $Res Function(_$DirectorsFailureImpl) then) =
      __$$DirectorsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions networkException});

  $NetworkExceptionsCopyWith<$Res> get networkException;
}

/// @nodoc
class __$$DirectorsFailureImplCopyWithImpl<$Res>
    extends _$DirectorStateCopyWithImpl<$Res, _$DirectorsFailureImpl>
    implements _$$DirectorsFailureImplCopyWith<$Res> {
  __$$DirectorsFailureImplCopyWithImpl(_$DirectorsFailureImpl _value,
      $Res Function(_$DirectorsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkException = null,
  }) {
    return _then(_$DirectorsFailureImpl(
      null == networkException
          ? _value.networkException
          : networkException // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get networkException {
    return $NetworkExceptionsCopyWith<$Res>(_value.networkException, (value) {
      return _then(_value.copyWith(networkException: value));
    });
  }
}

/// @nodoc

class _$DirectorsFailureImpl implements _DirectorsFailure {
  const _$DirectorsFailureImpl(this.networkException);

  @override
  final NetworkExceptions networkException;

  @override
  String toString() {
    return 'DirectorState.directorsFailure(networkException: $networkException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectorsFailureImpl &&
            (identical(other.networkException, networkException) ||
                other.networkException == networkException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectorsFailureImplCopyWith<_$DirectorsFailureImpl> get copyWith =>
      __$$DirectorsFailureImplCopyWithImpl<_$DirectorsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return directorsFailure(networkException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return directorsFailure?.call(networkException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsFailure != null) {
      return directorsFailure(networkException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return directorsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return directorsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (directorsFailure != null) {
      return directorsFailure(this);
    }
    return orElse();
  }
}

abstract class _DirectorsFailure implements DirectorState {
  const factory _DirectorsFailure(final NetworkExceptions networkException) =
      _$DirectorsFailureImpl;

  NetworkExceptions get networkException;
  @JsonKey(ignore: true)
  _$$DirectorsFailureImplCopyWith<_$DirectorsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDirectorSuccessImplCopyWith<$Res> {
  factory _$$DeleteDirectorSuccessImplCopyWith(
          _$DeleteDirectorSuccessImpl value,
          $Res Function(_$DeleteDirectorSuccessImpl) then) =
      __$$DeleteDirectorSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserModel> directors});
}

/// @nodoc
class __$$DeleteDirectorSuccessImplCopyWithImpl<$Res>
    extends _$DirectorStateCopyWithImpl<$Res, _$DeleteDirectorSuccessImpl>
    implements _$$DeleteDirectorSuccessImplCopyWith<$Res> {
  __$$DeleteDirectorSuccessImplCopyWithImpl(_$DeleteDirectorSuccessImpl _value,
      $Res Function(_$DeleteDirectorSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directors = null,
  }) {
    return _then(_$DeleteDirectorSuccessImpl(
      null == directors
          ? _value._directors
          : directors // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$DeleteDirectorSuccessImpl implements _DeleteDirectorSuccess {
  const _$DeleteDirectorSuccessImpl(final List<UserModel> directors)
      : _directors = directors;

  final List<UserModel> _directors;
  @override
  List<UserModel> get directors {
    if (_directors is EqualUnmodifiableListView) return _directors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directors);
  }

  @override
  String toString() {
    return 'DirectorState.deleteDirectorSuccess(directors: $directors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDirectorSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._directors, _directors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_directors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDirectorSuccessImplCopyWith<_$DeleteDirectorSuccessImpl>
      get copyWith => __$$DeleteDirectorSuccessImplCopyWithImpl<
          _$DeleteDirectorSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return deleteDirectorSuccess(directors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return deleteDirectorSuccess?.call(directors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (deleteDirectorSuccess != null) {
      return deleteDirectorSuccess(directors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return deleteDirectorSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return deleteDirectorSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (deleteDirectorSuccess != null) {
      return deleteDirectorSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteDirectorSuccess implements DirectorState {
  const factory _DeleteDirectorSuccess(final List<UserModel> directors) =
      _$DeleteDirectorSuccessImpl;

  List<UserModel> get directors;
  @JsonKey(ignore: true)
  _$$DeleteDirectorSuccessImplCopyWith<_$DeleteDirectorSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDirectorFailureImplCopyWith<$Res> {
  factory _$$DeleteDirectorFailureImplCopyWith(
          _$DeleteDirectorFailureImpl value,
          $Res Function(_$DeleteDirectorFailureImpl) then) =
      __$$DeleteDirectorFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$DeleteDirectorFailureImplCopyWithImpl<$Res>
    extends _$DirectorStateCopyWithImpl<$Res, _$DeleteDirectorFailureImpl>
    implements _$$DeleteDirectorFailureImplCopyWith<$Res> {
  __$$DeleteDirectorFailureImplCopyWithImpl(_$DeleteDirectorFailureImpl _value,
      $Res Function(_$DeleteDirectorFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DeleteDirectorFailureImpl(
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

class _$DeleteDirectorFailureImpl implements _DeleteDirectorFailure {
  const _$DeleteDirectorFailureImpl(this.error);

  @override
  final NetworkExceptions error;

  @override
  String toString() {
    return 'DirectorState.deleteDirectorFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDirectorFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDirectorFailureImplCopyWith<_$DeleteDirectorFailureImpl>
      get copyWith => __$$DeleteDirectorFailureImplCopyWithImpl<
          _$DeleteDirectorFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() directorsLoading,
    required TResult Function(List<UserModel> directors) directorsSuccess,
    required TResult Function(NetworkExceptions networkException)
        directorsFailure,
    required TResult Function(List<UserModel> directors) deleteDirectorSuccess,
    required TResult Function(NetworkExceptions error) deleteDirectorFailure,
  }) {
    return deleteDirectorFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? directorsLoading,
    TResult? Function(List<UserModel> directors)? directorsSuccess,
    TResult? Function(NetworkExceptions networkException)? directorsFailure,
    TResult? Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult? Function(NetworkExceptions error)? deleteDirectorFailure,
  }) {
    return deleteDirectorFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? directorsLoading,
    TResult Function(List<UserModel> directors)? directorsSuccess,
    TResult Function(NetworkExceptions networkException)? directorsFailure,
    TResult Function(List<UserModel> directors)? deleteDirectorSuccess,
    TResult Function(NetworkExceptions error)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (deleteDirectorFailure != null) {
      return deleteDirectorFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectorsLoading value) directorsLoading,
    required TResult Function(_DirectorsSuccess value) directorsSuccess,
    required TResult Function(_DirectorsFailure value) directorsFailure,
    required TResult Function(_DeleteDirectorSuccess value)
        deleteDirectorSuccess,
    required TResult Function(_DeleteDirectorFailure value)
        deleteDirectorFailure,
  }) {
    return deleteDirectorFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DirectorsLoading value)? directorsLoading,
    TResult? Function(_DirectorsSuccess value)? directorsSuccess,
    TResult? Function(_DirectorsFailure value)? directorsFailure,
    TResult? Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult? Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
  }) {
    return deleteDirectorFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectorsLoading value)? directorsLoading,
    TResult Function(_DirectorsSuccess value)? directorsSuccess,
    TResult Function(_DirectorsFailure value)? directorsFailure,
    TResult Function(_DeleteDirectorSuccess value)? deleteDirectorSuccess,
    TResult Function(_DeleteDirectorFailure value)? deleteDirectorFailure,
    required TResult orElse(),
  }) {
    if (deleteDirectorFailure != null) {
      return deleteDirectorFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteDirectorFailure implements DirectorState {
  const factory _DeleteDirectorFailure(final NetworkExceptions error) =
      _$DeleteDirectorFailureImpl;

  NetworkExceptions get error;
  @JsonKey(ignore: true)
  _$$DeleteDirectorFailureImplCopyWith<_$DeleteDirectorFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
