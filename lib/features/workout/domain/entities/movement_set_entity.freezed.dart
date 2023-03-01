// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_set_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovementSetEntity {
  UniqueId get id => throw _privateConstructorUsedError;
  RepetitionCount get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovementSetEntityCopyWith<MovementSetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementSetEntityCopyWith<$Res> {
  factory $MovementSetEntityCopyWith(
          MovementSetEntity value, $Res Function(MovementSetEntity) then) =
      _$MovementSetEntityCopyWithImpl<$Res, MovementSetEntity>;
  @useResult
  $Res call({UniqueId id, RepetitionCount count});
}

/// @nodoc
class _$MovementSetEntityCopyWithImpl<$Res, $Val extends MovementSetEntity>
    implements $MovementSetEntityCopyWith<$Res> {
  _$MovementSetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as RepetitionCount,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovementSetEntityCopyWith<$Res>
    implements $MovementSetEntityCopyWith<$Res> {
  factory _$$_MovementSetEntityCopyWith(_$_MovementSetEntity value,
          $Res Function(_$_MovementSetEntity) then) =
      __$$_MovementSetEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, RepetitionCount count});
}

/// @nodoc
class __$$_MovementSetEntityCopyWithImpl<$Res>
    extends _$MovementSetEntityCopyWithImpl<$Res, _$_MovementSetEntity>
    implements _$$_MovementSetEntityCopyWith<$Res> {
  __$$_MovementSetEntityCopyWithImpl(
      _$_MovementSetEntity _value, $Res Function(_$_MovementSetEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
  }) {
    return _then(_$_MovementSetEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as RepetitionCount,
    ));
  }
}

/// @nodoc

class _$_MovementSetEntity implements _MovementSetEntity {
  const _$_MovementSetEntity({required this.id, required this.count});

  @override
  final UniqueId id;
  @override
  final RepetitionCount count;

  @override
  String toString() {
    return 'MovementSetEntity(id: $id, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovementSetEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovementSetEntityCopyWith<_$_MovementSetEntity> get copyWith =>
      __$$_MovementSetEntityCopyWithImpl<_$_MovementSetEntity>(
          this, _$identity);
}

abstract class _MovementSetEntity implements MovementSetEntity {
  const factory _MovementSetEntity(
      {required final UniqueId id,
      required final RepetitionCount count}) = _$_MovementSetEntity;

  @override
  UniqueId get id;
  @override
  RepetitionCount get count;
  @override
  @JsonKey(ignore: true)
  _$$_MovementSetEntityCopyWith<_$_MovementSetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
