// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutDto {
  int get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TemplateDto? get template => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutDtoCopyWith<WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDtoCopyWith<$Res> {
  factory $WorkoutDtoCopyWith(
          WorkoutDto value, $Res Function(WorkoutDto) then) =
      _$WorkoutDtoCopyWithImpl<$Res, WorkoutDto>;
  @useResult
  $Res call({int id, DateTime date, TemplateDto? template});

  $TemplateDtoCopyWith<$Res>? get template;
}

/// @nodoc
class _$WorkoutDtoCopyWithImpl<$Res, $Val extends WorkoutDto>
    implements $WorkoutDtoCopyWith<$Res> {
  _$WorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateDtoCopyWith<$Res>? get template {
    if (_value.template == null) {
      return null;
    }

    return $TemplateDtoCopyWith<$Res>(_value.template!, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkoutDtoCopyWith<$Res>
    implements $WorkoutDtoCopyWith<$Res> {
  factory _$$_WorkoutDtoCopyWith(
          _$_WorkoutDto value, $Res Function(_$_WorkoutDto) then) =
      __$$_WorkoutDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime date, TemplateDto? template});

  @override
  $TemplateDtoCopyWith<$Res>? get template;
}

/// @nodoc
class __$$_WorkoutDtoCopyWithImpl<$Res>
    extends _$WorkoutDtoCopyWithImpl<$Res, _$_WorkoutDto>
    implements _$$_WorkoutDtoCopyWith<$Res> {
  __$$_WorkoutDtoCopyWithImpl(
      _$_WorkoutDto _value, $Res Function(_$_WorkoutDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? template = freezed,
  }) {
    return _then(_$_WorkoutDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateDto?,
    ));
  }
}

/// @nodoc

class _$_WorkoutDto implements _WorkoutDto {
  const _$_WorkoutDto(
      {required this.id, required this.date, required this.template});

  @override
  final int id;
  @override
  final DateTime date;
  @override
  final TemplateDto? template;

  @override
  String toString() {
    return 'WorkoutDto(id: $id, date: $date, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      __$$_WorkoutDtoCopyWithImpl<_$_WorkoutDto>(this, _$identity);
}

abstract class _WorkoutDto implements WorkoutDto {
  const factory _WorkoutDto(
      {required final int id,
      required final DateTime date,
      required final TemplateDto? template}) = _$_WorkoutDto;

  @override
  int get id;
  @override
  DateTime get date;
  @override
  TemplateDto? get template;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseDtoCopyWith<ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDtoCopyWith<$Res> {
  factory $ExerciseDtoCopyWith(
          ExerciseDto value, $Res Function(ExerciseDto) then) =
      _$ExerciseDtoCopyWithImpl<$Res, ExerciseDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res, $Val extends ExerciseDto>
    implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._value, this._then);

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
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExerciseDtoCopyWith<$Res>
    implements $ExerciseDtoCopyWith<$Res> {
  factory _$$_ExerciseDtoCopyWith(
          _$_ExerciseDto value, $Res Function(_$_ExerciseDto) then) =
      __$$_ExerciseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_ExerciseDtoCopyWithImpl<$Res>
    extends _$ExerciseDtoCopyWithImpl<$Res, _$_ExerciseDto>
    implements _$$_ExerciseDtoCopyWith<$Res> {
  __$$_ExerciseDtoCopyWithImpl(
      _$_ExerciseDto _value, $Res Function(_$_ExerciseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_ExerciseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ExerciseDto implements _ExerciseDto {
  const _$_ExerciseDto({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ExerciseDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      __$$_ExerciseDtoCopyWithImpl<_$_ExerciseDto>(this, _$identity);
}

abstract class _ExerciseDto implements ExerciseDto {
  const factory _ExerciseDto(
      {required final int id, required final String name}) = _$_ExerciseDto;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovementDto {
  int get id => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  IList<MovementSetDto> get sets => throw _privateConstructorUsedError;
  WorkoutDto get workout => throw _privateConstructorUsedError;
  ExerciseDto get exercise => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovementDtoCopyWith<MovementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementDtoCopyWith<$Res> {
  factory $MovementDtoCopyWith(
          MovementDto value, $Res Function(MovementDto) then) =
      _$MovementDtoCopyWithImpl<$Res, MovementDto>;
  @useResult
  $Res call(
      {int id,
      double weight,
      IList<MovementSetDto> sets,
      WorkoutDto workout,
      ExerciseDto exercise});

  $WorkoutDtoCopyWith<$Res> get workout;
  $ExerciseDtoCopyWith<$Res> get exercise;
}

/// @nodoc
class _$MovementDtoCopyWithImpl<$Res, $Val extends MovementDto>
    implements $MovementDtoCopyWith<$Res> {
  _$MovementDtoCopyWithImpl(this._value, this._then);

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
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as IList<MovementSetDto>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutDto,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutDtoCopyWith<$Res> get workout {
    return $WorkoutDtoCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseDtoCopyWith<$Res> get exercise {
    return $ExerciseDtoCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MovementDtoCopyWith<$Res>
    implements $MovementDtoCopyWith<$Res> {
  factory _$$_MovementDtoCopyWith(
          _$_MovementDto value, $Res Function(_$_MovementDto) then) =
      __$$_MovementDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double weight,
      IList<MovementSetDto> sets,
      WorkoutDto workout,
      ExerciseDto exercise});

  @override
  $WorkoutDtoCopyWith<$Res> get workout;
  @override
  $ExerciseDtoCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$_MovementDtoCopyWithImpl<$Res>
    extends _$MovementDtoCopyWithImpl<$Res, _$_MovementDto>
    implements _$$_MovementDtoCopyWith<$Res> {
  __$$_MovementDtoCopyWithImpl(
      _$_MovementDto _value, $Res Function(_$_MovementDto) _then)
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
    return _then(_$_MovementDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as IList<MovementSetDto>,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as WorkoutDto,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseDto,
    ));
  }
}

/// @nodoc

class _$_MovementDto implements _MovementDto {
  const _$_MovementDto(
      {required this.id,
      required this.weight,
      required this.sets,
      required this.workout,
      required this.exercise});

  @override
  final int id;
  @override
  final double weight;
  @override
  final IList<MovementSetDto> sets;
  @override
  final WorkoutDto workout;
  @override
  final ExerciseDto exercise;

  @override
  String toString() {
    return 'MovementDto(id: $id, weight: $weight, sets: $sets, workout: $workout, exercise: $exercise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovementDto &&
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
  _$$_MovementDtoCopyWith<_$_MovementDto> get copyWith =>
      __$$_MovementDtoCopyWithImpl<_$_MovementDto>(this, _$identity);
}

abstract class _MovementDto implements MovementDto {
  const factory _MovementDto(
      {required final int id,
      required final double weight,
      required final IList<MovementSetDto> sets,
      required final WorkoutDto workout,
      required final ExerciseDto exercise}) = _$_MovementDto;

  @override
  int get id;
  @override
  double get weight;
  @override
  IList<MovementSetDto> get sets;
  @override
  WorkoutDto get workout;
  @override
  ExerciseDto get exercise;
  @override
  @JsonKey(ignore: true)
  _$$_MovementDtoCopyWith<_$_MovementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovementSetDto {
  int get id => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovementSetDtoCopyWith<MovementSetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementSetDtoCopyWith<$Res> {
  factory $MovementSetDtoCopyWith(
          MovementSetDto value, $Res Function(MovementSetDto) then) =
      _$MovementSetDtoCopyWithImpl<$Res, MovementSetDto>;
  @useResult
  $Res call({int id, int count});
}

/// @nodoc
class _$MovementSetDtoCopyWithImpl<$Res, $Val extends MovementSetDto>
    implements $MovementSetDtoCopyWith<$Res> {
  _$MovementSetDtoCopyWithImpl(this._value, this._then);

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
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovementSetDtoCopyWith<$Res>
    implements $MovementSetDtoCopyWith<$Res> {
  factory _$$_MovementSetDtoCopyWith(
          _$_MovementSetDto value, $Res Function(_$_MovementSetDto) then) =
      __$$_MovementSetDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int count});
}

/// @nodoc
class __$$_MovementSetDtoCopyWithImpl<$Res>
    extends _$MovementSetDtoCopyWithImpl<$Res, _$_MovementSetDto>
    implements _$$_MovementSetDtoCopyWith<$Res> {
  __$$_MovementSetDtoCopyWithImpl(
      _$_MovementSetDto _value, $Res Function(_$_MovementSetDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
  }) {
    return _then(_$_MovementSetDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MovementSetDto implements _MovementSetDto {
  const _$_MovementSetDto({required this.id, required this.count});

  @override
  final int id;
  @override
  final int count;

  @override
  String toString() {
    return 'MovementSetDto(id: $id, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovementSetDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovementSetDtoCopyWith<_$_MovementSetDto> get copyWith =>
      __$$_MovementSetDtoCopyWithImpl<_$_MovementSetDto>(this, _$identity);
}

abstract class _MovementSetDto implements MovementSetDto {
  const factory _MovementSetDto(
      {required final int id, required final int count}) = _$_MovementSetDto;

  @override
  int get id;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_MovementSetDtoCopyWith<_$_MovementSetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TemplateDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  IList<ExerciseDto> get exercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateDtoCopyWith<TemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateDtoCopyWith<$Res> {
  factory $TemplateDtoCopyWith(
          TemplateDto value, $Res Function(TemplateDto) then) =
      _$TemplateDtoCopyWithImpl<$Res, TemplateDto>;
  @useResult
  $Res call({int id, String name, int color, IList<ExerciseDto> exercises});
}

/// @nodoc
class _$TemplateDtoCopyWithImpl<$Res, $Val extends TemplateDto>
    implements $TemplateDtoCopyWith<$Res> {
  _$TemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as IList<ExerciseDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateDtoCopyWith<$Res>
    implements $TemplateDtoCopyWith<$Res> {
  factory _$$_TemplateDtoCopyWith(
          _$_TemplateDto value, $Res Function(_$_TemplateDto) then) =
      __$$_TemplateDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int color, IList<ExerciseDto> exercises});
}

/// @nodoc
class __$$_TemplateDtoCopyWithImpl<$Res>
    extends _$TemplateDtoCopyWithImpl<$Res, _$_TemplateDto>
    implements _$$_TemplateDtoCopyWith<$Res> {
  __$$_TemplateDtoCopyWithImpl(
      _$_TemplateDto _value, $Res Function(_$_TemplateDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? exercises = null,
  }) {
    return _then(_$_TemplateDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as IList<ExerciseDto>,
    ));
  }
}

/// @nodoc

class _$_TemplateDto implements _TemplateDto {
  const _$_TemplateDto(
      {required this.id,
      required this.name,
      required this.color,
      required this.exercises});

  @override
  final int id;
  @override
  final String name;
  @override
  final int color;
  @override
  final IList<ExerciseDto> exercises;

  @override
  String toString() {
    return 'TemplateDto(id: $id, name: $name, color: $color, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other.exercises, exercises));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, color,
      const DeepCollectionEquality().hash(exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateDtoCopyWith<_$_TemplateDto> get copyWith =>
      __$$_TemplateDtoCopyWithImpl<_$_TemplateDto>(this, _$identity);
}

abstract class _TemplateDto implements TemplateDto {
  const factory _TemplateDto(
      {required final int id,
      required final String name,
      required final int color,
      required final IList<ExerciseDto> exercises}) = _$_TemplateDto;

  @override
  int get id;
  @override
  String get name;
  @override
  int get color;
  @override
  IList<ExerciseDto> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateDtoCopyWith<_$_TemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
