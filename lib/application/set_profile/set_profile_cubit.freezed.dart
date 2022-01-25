// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SetProfileStateTearOff {
  const _$SetProfileStateTearOff();

  _SetProfileState call(
      {required String username,
      required File? image,
      required bool isLoading,
      required bool isSuccess,
      required Option<UserFailure> failureOption}) {
    return _SetProfileState(
      username: username,
      image: image,
      isLoading: isLoading,
      isSuccess: isSuccess,
      failureOption: failureOption,
    );
  }
}

/// @nodoc
const $SetProfileState = _$SetProfileStateTearOff();

/// @nodoc
mixin _$SetProfileState {
  String get username => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  Option<UserFailure> get failureOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetProfileStateCopyWith<SetProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetProfileStateCopyWith<$Res> {
  factory $SetProfileStateCopyWith(
          SetProfileState value, $Res Function(SetProfileState) then) =
      _$SetProfileStateCopyWithImpl<$Res>;
  $Res call(
      {String username,
      File? image,
      bool isLoading,
      bool isSuccess,
      Option<UserFailure> failureOption});
}

/// @nodoc
class _$SetProfileStateCopyWithImpl<$Res>
    implements $SetProfileStateCopyWith<$Res> {
  _$SetProfileStateCopyWithImpl(this._value, this._then);

  final SetProfileState _value;
  // ignore: unused_field
  final $Res Function(SetProfileState) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? image = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? failureOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<UserFailure>,
    ));
  }
}

/// @nodoc
abstract class _$SetProfileStateCopyWith<$Res>
    implements $SetProfileStateCopyWith<$Res> {
  factory _$SetProfileStateCopyWith(
          _SetProfileState value, $Res Function(_SetProfileState) then) =
      __$SetProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      File? image,
      bool isLoading,
      bool isSuccess,
      Option<UserFailure> failureOption});
}

/// @nodoc
class __$SetProfileStateCopyWithImpl<$Res>
    extends _$SetProfileStateCopyWithImpl<$Res>
    implements _$SetProfileStateCopyWith<$Res> {
  __$SetProfileStateCopyWithImpl(
      _SetProfileState _value, $Res Function(_SetProfileState) _then)
      : super(_value, (v) => _then(v as _SetProfileState));

  @override
  _SetProfileState get _value => super._value as _SetProfileState;

  @override
  $Res call({
    Object? username = freezed,
    Object? image = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? failureOption = freezed,
  }) {
    return _then(_SetProfileState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<UserFailure>,
    ));
  }
}

/// @nodoc

class _$_SetProfileState implements _SetProfileState {
  const _$_SetProfileState(
      {required this.username,
      required this.image,
      required this.isLoading,
      required this.isSuccess,
      required this.failureOption});

  @override
  final String username;
  @override
  final File? image;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final Option<UserFailure> failureOption;

  @override
  String toString() {
    return 'SetProfileState(username: $username, image: $image, isLoading: $isLoading, isSuccess: $isSuccess, failureOption: $failureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetProfileState &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality()
                .equals(other.failureOption, failureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(failureOption));

  @JsonKey(ignore: true)
  @override
  _$SetProfileStateCopyWith<_SetProfileState> get copyWith =>
      __$SetProfileStateCopyWithImpl<_SetProfileState>(this, _$identity);
}

abstract class _SetProfileState implements SetProfileState {
  const factory _SetProfileState(
      {required String username,
      required File? image,
      required bool isLoading,
      required bool isSuccess,
      required Option<UserFailure> failureOption}) = _$_SetProfileState;

  @override
  String get username;
  @override
  File? get image;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  Option<UserFailure> get failureOption;
  @override
  @JsonKey(ignore: true)
  _$SetProfileStateCopyWith<_SetProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
