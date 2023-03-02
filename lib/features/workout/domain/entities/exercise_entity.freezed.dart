// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExerciseEntity {
  UniqueId get id => throw _privateConstructorUsedError;
  ExerciseName get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseEntityCopyWith<ExerciseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseEntityCopyWith<$Res> {
  factory $ExerciseEntityCopyWith(
          ExerciseEntity value, $Res Function(ExerciseEntity) then) =
      _$ExerciseEntityCopyWithImpl<$Res, ExerciseEntity>;
  @useResult
  $Res call({UniqueId id, ExerciseName name});
}

/// @nodoc
class _$ExerciseEntityCopyWithImpl<$Res, $Val extends ExerciseEntity>
    implements $ExerciseEntityCopyWith<$Res> {
  _$ExerciseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ExerciseName,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExerciseEntityCopyWith<$Res>
    implements $ExerciseEntityCopyWith<$Res> {
  factory _$$_ExerciseEntityCopyWith(
          _$_ExerciseEntity value, $Res Function(_$_ExerciseEntity) then) =
      __$$_ExerciseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, ExerciseName name});
}

/// @nodoc
class __$$_ExerciseEntityCopyWithImpl<$Res>
    extends _$ExerciseEntityCopyWithImpl<$Res, _$_ExerciseEntity>
    implements _$$_ExerciseEntityCopyWith<$Res> {
  __$$_ExerciseEntityCopyWithImpl(
      _$_ExerciseEntity _value, $Res Function(_$_ExerciseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_ExerciseEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ExerciseName,
    ));
  }
}

/// @nodoc

class _$_ExerciseEntity implements _ExerciseEntity {
  const _$_ExerciseEntity({required this.id, required this.name});

  @override
  final UniqueId id;
  @override
  final ExerciseName name;

  @override
  String toString() {
    return 'ExerciseEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExerciseEntityCopyWith<_$_ExerciseEntity> get copyWith =>
      __$$_ExerciseEntityCopyWithImpl<_$_ExerciseEntity>(this, _$identity);
}

abstract class _ExerciseEntity implements ExerciseEntity {
  const factory _ExerciseEntity(
      {required final UniqueId id,
      required final ExerciseName name}) = _$_ExerciseEntity;

  @override
  UniqueId get id;
  @override
  ExerciseName get name;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseEntityCopyWith<_$_ExerciseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
