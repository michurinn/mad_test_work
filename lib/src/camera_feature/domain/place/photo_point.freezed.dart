// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoPoint _$PhotoPointFromJson(Map<String, dynamic> json) {
  return _PhotoPoint.fromJson(json);
}

/// @nodoc
mixin _$PhotoPoint {
  num get x => throw _privateConstructorUsedError;
  num get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoPointCopyWith<PhotoPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoPointCopyWith<$Res> {
  factory $PhotoPointCopyWith(
          PhotoPoint value, $Res Function(PhotoPoint) then) =
      _$PhotoPointCopyWithImpl<$Res, PhotoPoint>;
  @useResult
  $Res call({num x, num y});
}

/// @nodoc
class _$PhotoPointCopyWithImpl<$Res, $Val extends PhotoPoint>
    implements $PhotoPointCopyWith<$Res> {
  _$PhotoPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as num,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoPointImplCopyWith<$Res>
    implements $PhotoPointCopyWith<$Res> {
  factory _$$PhotoPointImplCopyWith(
          _$PhotoPointImpl value, $Res Function(_$PhotoPointImpl) then) =
      __$$PhotoPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num x, num y});
}

/// @nodoc
class __$$PhotoPointImplCopyWithImpl<$Res>
    extends _$PhotoPointCopyWithImpl<$Res, _$PhotoPointImpl>
    implements _$$PhotoPointImplCopyWith<$Res> {
  __$$PhotoPointImplCopyWithImpl(
      _$PhotoPointImpl _value, $Res Function(_$PhotoPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$PhotoPointImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as num,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoPointImpl implements _PhotoPoint {
  const _$PhotoPointImpl({required this.x, required this.y});

  factory _$PhotoPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoPointImplFromJson(json);

  @override
  final num x;
  @override
  final num y;

  @override
  String toString() {
    return 'PhotoPoint(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoPointImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoPointImplCopyWith<_$PhotoPointImpl> get copyWith =>
      __$$PhotoPointImplCopyWithImpl<_$PhotoPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoPointImplToJson(
      this,
    );
  }
}

abstract class _PhotoPoint implements PhotoPoint {
  const factory _PhotoPoint({required final num x, required final num y}) =
      _$PhotoPointImpl;

  factory _PhotoPoint.fromJson(Map<String, dynamic> json) =
      _$PhotoPointImpl.fromJson;

  @override
  num get x;
  @override
  num get y;
  @override
  @JsonKey(ignore: true)
  _$$PhotoPointImplCopyWith<_$PhotoPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
