// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'luggage_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LuggageEntity {
  bool get hasLuggage => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LuggageEntityCopyWith<LuggageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuggageEntityCopyWith<$Res> {
  factory $LuggageEntityCopyWith(
          LuggageEntity value, $Res Function(LuggageEntity) then) =
      _$LuggageEntityCopyWithImpl<$Res, LuggageEntity>;
  @useResult
  $Res call({bool hasLuggage, int? price});
}

/// @nodoc
class _$LuggageEntityCopyWithImpl<$Res, $Val extends LuggageEntity>
    implements $LuggageEntityCopyWith<$Res> {
  _$LuggageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasLuggage = null,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      hasLuggage: null == hasLuggage
          ? _value.hasLuggage
          : hasLuggage // ignore: cast_nullable_to_non_nullable
              as bool,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LuggageEntityImplCopyWith<$Res>
    implements $LuggageEntityCopyWith<$Res> {
  factory _$$LuggageEntityImplCopyWith(
          _$LuggageEntityImpl value, $Res Function(_$LuggageEntityImpl) then) =
      __$$LuggageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasLuggage, int? price});
}

/// @nodoc
class __$$LuggageEntityImplCopyWithImpl<$Res>
    extends _$LuggageEntityCopyWithImpl<$Res, _$LuggageEntityImpl>
    implements _$$LuggageEntityImplCopyWith<$Res> {
  __$$LuggageEntityImplCopyWithImpl(
      _$LuggageEntityImpl _value, $Res Function(_$LuggageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasLuggage = null,
    Object? price = freezed,
  }) {
    return _then(_$LuggageEntityImpl(
      hasLuggage: null == hasLuggage
          ? _value.hasLuggage
          : hasLuggage // ignore: cast_nullable_to_non_nullable
              as bool,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LuggageEntityImpl implements _LuggageEntity {
  const _$LuggageEntityImpl({required this.hasLuggage, this.price});

  @override
  final bool hasLuggage;
  @override
  final int? price;

  @override
  String toString() {
    return 'LuggageEntity(hasLuggage: $hasLuggage, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LuggageEntityImpl &&
            (identical(other.hasLuggage, hasLuggage) ||
                other.hasLuggage == hasLuggage) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasLuggage, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LuggageEntityImplCopyWith<_$LuggageEntityImpl> get copyWith =>
      __$$LuggageEntityImplCopyWithImpl<_$LuggageEntityImpl>(this, _$identity);
}

abstract class _LuggageEntity implements LuggageEntity {
  const factory _LuggageEntity(
      {required final bool hasLuggage, final int? price}) = _$LuggageEntityImpl;

  @override
  bool get hasLuggage;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$LuggageEntityImplCopyWith<_$LuggageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
