// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aggregates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutAggregate {
  Workout get workout => throw _privateConstructorUsedError;
  TemplateAggregate? get template => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutAggregateCopyWith<WorkoutAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutAggregateCopyWith<$Res> {
  factory $WorkoutAggregateCopyWith(
          WorkoutAggregate value, $Res Function(WorkoutAggregate) then) =
      _$WorkoutAggregateCopyWithImpl<$Res, WorkoutAggregate>;
  @useResult
  $Res call({Workout workout, TemplateAggregate? template});

  $TemplateAggregateCopyWith<$Res>? get template;
}

/// @nodoc
class _$WorkoutAggregateCopyWithImpl<$Res, $Val extends WorkoutAggregate>
    implements $WorkoutAggregateCopyWith<$Res> {
  _$WorkoutAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      workout: freezed == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateAggregate?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateAggregateCopyWith<$Res>? get template {
    if (_value.template == null) {
      return null;
    }

    return $TemplateAggregateCopyWith<$Res>(_value.template!, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkoutAggregateCopyWith<$Res>
    implements $WorkoutAggregateCopyWith<$Res> {
  factory _$$_WorkoutAggregateCopyWith(
          _$_WorkoutAggregate value, $Res Function(_$_WorkoutAggregate) then) =
      __$$_WorkoutAggregateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Workout workout, TemplateAggregate? template});

  @override
  $TemplateAggregateCopyWith<$Res>? get template;
}

/// @nodoc
class __$$_WorkoutAggregateCopyWithImpl<$Res>
    extends _$WorkoutAggregateCopyWithImpl<$Res, _$_WorkoutAggregate>
    implements _$$_WorkoutAggregateCopyWith<$Res> {
  __$$_WorkoutAggregateCopyWithImpl(
      _$_WorkoutAggregate _value, $Res Function(_$_WorkoutAggregate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = freezed,
    Object? template = freezed,
  }) {
    return _then(_$_WorkoutAggregate(
      workout: freezed == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateAggregate?,
    ));
  }
}

/// @nodoc

class _$_WorkoutAggregate implements _WorkoutAggregate {
  const _$_WorkoutAggregate({required this.workout, required this.template});

  @override
  final Workout workout;
  @override
  final TemplateAggregate? template;

  @override
  String toString() {
    return 'WorkoutAggregate(workout: $workout, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutAggregate &&
            const DeepCollectionEquality().equals(other.workout, workout) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(workout), template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutAggregateCopyWith<_$_WorkoutAggregate> get copyWith =>
      __$$_WorkoutAggregateCopyWithImpl<_$_WorkoutAggregate>(this, _$identity);
}

abstract class _WorkoutAggregate implements WorkoutAggregate {
  const factory _WorkoutAggregate(
      {required final Workout workout,
      required final TemplateAggregate? template}) = _$_WorkoutAggregate;

  @override
  Workout get workout;
  @override
  TemplateAggregate? get template;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutAggregateCopyWith<_$_WorkoutAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovementAggregate {
  Movement get movement => throw _privateConstructorUsedError;
  List<MovementSet> get sets => throw _privateConstructorUsedError;
  WorkoutAggregate get workout => throw _privateConstructorUsedError;
  Exercise get exercise => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovementAggregateCopyWith<MovementAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementAggregateCopyWith<$Res> {
  factory $MovementAggregateCopyWith(
          MovementAggregate value, $Res Function(MovementAggregate) then) =
      _$MovementAggregateCopyWithImpl<$Res, MovementAggregate>;
  @useResult
  $Res call(
      {Movement movement,
      List<MovementSet> sets,
      WorkoutAggregate workout,
      Exercise exercise});

  $WorkoutAggregateCopyWith<$Res> get workout;
}

/// @nodoc
class _$MovementAggregateCopyWithImpl<$Res, $Val extends MovementAggregate>
    implements $MovementAggregateCopyWith<$Res> {
  _$MovementAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movement = freezed,
    Object? sets = null,
    Object? workout = null,
    Object? exercise = freezed,
  }) {
    return _then(_value.copyWith(
      movement: freezed == movement
          ? _value.movement
          : movement // ignore: cast_nullable_to_non_nullable
              as Movement,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<MovementSet>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutAggregate,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutAggregateCopyWith<$Res> get workout {
    return $WorkoutAggregateCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MovementAggregateCopyWith<$Res>
    implements $MovementAggregateCopyWith<$Res> {
  factory _$$_MovementAggregateCopyWith(_$_MovementAggregate value,
          $Res Function(_$_MovementAggregate) then) =
      __$$_MovementAggregateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Movement movement,
      List<MovementSet> sets,
      WorkoutAggregate workout,
      Exercise exercise});

  @override
  $WorkoutAggregateCopyWith<$Res> get workout;
}

/// @nodoc
class __$$_MovementAggregateCopyWithImpl<$Res>
    extends _$MovementAggregateCopyWithImpl<$Res, _$_MovementAggregate>
    implements _$$_MovementAggregateCopyWith<$Res> {
  __$$_MovementAggregateCopyWithImpl(
      _$_MovementAggregate _value, $Res Function(_$_MovementAggregate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movement = freezed,
    Object? sets = null,
    Object? workout = null,
    Object? exercise = freezed,
  }) {
    return _then(_$_MovementAggregate(
      movement: freezed == movement
          ? _value.movement
          : movement // ignore: cast_nullable_to_non_nullable
              as Movement,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<MovementSet>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutAggregate,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
    ));
  }
}

/// @nodoc

class _$_MovementAggregate implements _MovementAggregate {
  const _$_MovementAggregate(
      {required this.movement,
      required final List<MovementSet> sets,
      required this.workout,
      required this.exercise})
      : _sets = sets;

  @override
  final Movement movement;
  final List<MovementSet> _sets;
  @override
  List<MovementSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final WorkoutAggregate workout;
  @override
  final Exercise exercise;

  @override
  String toString() {
    return 'MovementAggregate(movement: $movement, sets: $sets, workout: $workout, exercise: $exercise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovementAggregate &&
            const DeepCollectionEquality().equals(other.movement, movement) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.workout, workout) || other.workout == workout) &&
            const DeepCollectionEquality().equals(other.exercise, exercise));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(movement),
      const DeepCollectionEquality().hash(_sets),
      workout,
      const DeepCollectionEquality().hash(exercise));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovementAggregateCopyWith<_$_MovementAggregate> get copyWith =>
      __$$_MovementAggregateCopyWithImpl<_$_MovementAggregate>(
          this, _$identity);
}

abstract class _MovementAggregate implements MovementAggregate {
  const factory _MovementAggregate(
      {required final Movement movement,
      required final List<MovementSet> sets,
      required final WorkoutAggregate workout,
      required final Exercise exercise}) = _$_MovementAggregate;

  @override
  Movement get movement;
  @override
  List<MovementSet> get sets;
  @override
  WorkoutAggregate get workout;
  @override
  Exercise get exercise;
  @override
  @JsonKey(ignore: true)
  _$$_MovementAggregateCopyWith<_$_MovementAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TemplateAggregate {
  Template get template => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateAggregateCopyWith<TemplateAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateAggregateCopyWith<$Res> {
  factory $TemplateAggregateCopyWith(
          TemplateAggregate value, $Res Function(TemplateAggregate) then) =
      _$TemplateAggregateCopyWithImpl<$Res, TemplateAggregate>;
  @useResult
  $Res call({Template template, List<Exercise> exercises});
}

/// @nodoc
class _$TemplateAggregateCopyWithImpl<$Res, $Val extends TemplateAggregate>
    implements $TemplateAggregateCopyWith<$Res> {
  _$TemplateAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = freezed,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as Template,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateAggregateCopyWith<$Res>
    implements $TemplateAggregateCopyWith<$Res> {
  factory _$$_TemplateAggregateCopyWith(_$_TemplateAggregate value,
          $Res Function(_$_TemplateAggregate) then) =
      __$$_TemplateAggregateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Template template, List<Exercise> exercises});
}

/// @nodoc
class __$$_TemplateAggregateCopyWithImpl<$Res>
    extends _$TemplateAggregateCopyWithImpl<$Res, _$_TemplateAggregate>
    implements _$$_TemplateAggregateCopyWith<$Res> {
  __$$_TemplateAggregateCopyWithImpl(
      _$_TemplateAggregate _value, $Res Function(_$_TemplateAggregate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = freezed,
    Object? exercises = null,
  }) {
    return _then(_$_TemplateAggregate(
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as Template,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc

class _$_TemplateAggregate implements _TemplateAggregate {
  const _$_TemplateAggregate(
      {required this.template, required final List<Exercise> exercises})
      : _exercises = exercises;

  @override
  final Template template;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'TemplateAggregate(template: $template, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateAggregate &&
            const DeepCollectionEquality().equals(other.template, template) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(template),
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateAggregateCopyWith<_$_TemplateAggregate> get copyWith =>
      __$$_TemplateAggregateCopyWithImpl<_$_TemplateAggregate>(
          this, _$identity);
}

abstract class _TemplateAggregate implements TemplateAggregate {
  const factory _TemplateAggregate(
      {required final Template template,
      required final List<Exercise> exercises}) = _$_TemplateAggregate;

  @override
  Template get template;
  @override
  List<Exercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateAggregateCopyWith<_$_TemplateAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}
