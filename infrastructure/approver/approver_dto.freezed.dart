// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approver_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApproverDto _$ApproverDtoFromJson(Map<String, dynamic> json) {
  return _ApproverDto.fromJson(json);
}

/// @nodoc
class _$ApproverDtoTearOff {
  const _$ApproverDtoTearOff();

  _ApproverDto call({required String name, required String surname}) {
    return _ApproverDto(
      name: name,
      surname: surname,
    );
  }

  ApproverDto fromJson(Map<String, Object?> json) {
    return ApproverDto.fromJson(json);
  }
}

/// @nodoc
const $ApproverDto = _$ApproverDtoTearOff();

/// @nodoc
mixin _$ApproverDto {
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproverDtoCopyWith<ApproverDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverDtoCopyWith<$Res> {
  factory $ApproverDtoCopyWith(
          ApproverDto value, $Res Function(ApproverDto) then) =
      _$ApproverDtoCopyWithImpl<$Res>;
  $Res call({String name, String surname});
}

/// @nodoc
class _$ApproverDtoCopyWithImpl<$Res> implements $ApproverDtoCopyWith<$Res> {
  _$ApproverDtoCopyWithImpl(this._value, this._then);

  final ApproverDto _value;
  // ignore: unused_field
  final $Res Function(ApproverDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApproverDtoCopyWith<$Res>
    implements $ApproverDtoCopyWith<$Res> {
  factory _$ApproverDtoCopyWith(
          _ApproverDto value, $Res Function(_ApproverDto) then) =
      __$ApproverDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String surname});
}

/// @nodoc
class __$ApproverDtoCopyWithImpl<$Res> extends _$ApproverDtoCopyWithImpl<$Res>
    implements _$ApproverDtoCopyWith<$Res> {
  __$ApproverDtoCopyWithImpl(
      _ApproverDto _value, $Res Function(_ApproverDto) _then)
      : super(_value, (v) => _then(v as _ApproverDto));

  @override
  _ApproverDto get _value => super._value as _ApproverDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_ApproverDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApproverDto implements _ApproverDto {
  const _$_ApproverDto({required this.name, required this.surname});

  factory _$_ApproverDto.fromJson(Map<String, dynamic> json) =>
      _$$_ApproverDtoFromJson(json);

  @override
  final String name;
  @override
  final String surname;

  @override
  String toString() {
    return 'ApproverDto(name: $name, surname: $surname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApproverDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, surname);

  @JsonKey(ignore: true)
  @override
  _$ApproverDtoCopyWith<_ApproverDto> get copyWith =>
      __$ApproverDtoCopyWithImpl<_ApproverDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApproverDtoToJson(this);
  }
}

abstract class _ApproverDto implements ApproverDto {
  const factory _ApproverDto({required String name, required String surname}) =
      _$_ApproverDto;

  factory _ApproverDto.fromJson(Map<String, dynamic> json) =
      _$_ApproverDto.fromJson;

  @override
  String get name;
  @override
  String get surname;
  @override
  @JsonKey(ignore: true)
  _$ApproverDtoCopyWith<_ApproverDto> get copyWith =>
      throw _privateConstructorUsedError;
}
