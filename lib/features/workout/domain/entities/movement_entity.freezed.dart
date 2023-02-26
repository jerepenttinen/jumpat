// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovementEntity {
  UniqueId get id => throw _privateConstructorUsedError;
  MovementWeight get weight => throw _privateConstructorUsedError;
  IList<MovementSet> get sets => throw _privateConstructorUsedError;
  WorkoutEntity get workout => throw _privateConstructorUsedError;
  ExerciseEntity get exercise => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovementEntityCopyWith<MovementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementEntityCopyWith<$Res> {
  factory $MovementEntityCopyWith(
          MovementEntity value, $Res Function(MovementEntity) then) =
      _$MovementEntityCopyWithImpl<$Res, MovementEntity>;
  @useResult
  $Res call(
      {UniqueId id,
      MovementWeight weight,
      IList<MovementSet> sets,
      WorkoutEntity workout,
      ExerciseEntity exercise});

  $WorkoutEntityCopyWith<$Res> get workout;
  $ExerciseEntityCopyWith<$Res> get exercise;
}

/// @nodoc
class _$MovementEntityCopyWithImpl<$Res, $Val extends MovementEntity>
    implements $MovementEntityCopyWith<$Res> {
  _$MovementEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? sets = null,
    Object? workout = null,
    Object? exercise = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as MovementWeight,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as IList<MovementSet>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutEntity,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutEntityCopyWith<$Res> get workout {
    return $WorkoutEntityCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseEntityCopyWith<$Res> get exercise {
    return $ExerciseEntityCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MovementEntityCopyWith<$Res>
    implements $MovementEntityCopyWith<$Res> {
  factory _$$_MovementEntityCopyWith(
          _$_MovementEntity value, $Res Function(_$_MovementEntity) then) =
      __$$_MovementEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      MovementWeight weight,
      IList<MovementSet> sets,
      WorkoutEntity workout,
      ExerciseEntity exercise});

  @override
  $WorkoutEntityCopyWith<$Res> get workout;
  @override
  $ExerciseEntityCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$_MovementEntityCopyWithImpl<$Res>
    extends _$MovementEntityCopyWithImpl<$Res, _$_MovementEntity>
    implements _$$_MovementEntityCopyWith<$Res> {
  __$$_MovementEntityCopyWithImpl(
      _$_MovementEntity _value, $Res Function(_$_MovementEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? sets = null,
    Object? workout = null,
    Object? exercise = null,
  }) {
    return _then(_$_MovementEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as MovementWeight,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as IList<MovementSet>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutEntity,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity,
    ));
  }
}

/// @nodoc

class _$_MovementEntity implements _MovementEntity {
  const _$_MovementEntity(
      {required this.id,
      required this.weight,
      required this.sets,
      required this.workout,
      required this.exercise});

  @override
  final UniqueId id;
  @override
  final MovementWeight weight;
  @override
  final IList<MovementSet> sets;
  @override
  final WorkoutEntity workout;
  @override
  final ExerciseEntity exercise;

  @override
  String toString() {
    return 'MovementEntity(id: $id, weight: $weight, sets: $sets, workout: $workout, exercise: $exercise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovementEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other.sets, sets) &&
            (identical(other.workout, workout) || other.workout == workout) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, weight,
      const DeepCollectionEquality().hash(sets), workout, exercise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovementEntityCopyWith<_$_MovementEntity> get copyWith =>
      __$$_MovementEntityCopyWithImpl<_$_MovementEntity>(this, _$identity);
}

abstract class _MovementEntity implements MovementEntity {
  const factory _MovementEntity(
      {required final UniqueId id,
      required final MovementWeight weight,
      required final IList<MovementSet> sets,
      required final WorkoutEntity workout,
      required final ExerciseEntity exercise}) = _$_MovementEntity;

  @override
  UniqueId get id;
  @override
  MovementWeight get weight;
  @override
  IList<MovementSet> get sets;
  @override
  WorkoutEntity get workout;
  @override
  ExerciseEntity get exercise;
  @override
  @JsonKey(ignore: true)
  _$$_MovementEntityCopyWith<_$_MovementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
