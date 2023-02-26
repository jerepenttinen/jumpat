// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutEntity {
  UniqueId get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  IList<MovementEntity> get movements => throw _privateConstructorUsedError;
  Option<TemplateEntity> get template => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutEntityCopyWith<WorkoutEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutEntityCopyWith<$Res> {
  factory $WorkoutEntityCopyWith(
          WorkoutEntity value, $Res Function(WorkoutEntity) then) =
      _$WorkoutEntityCopyWithImpl<$Res, WorkoutEntity>;
  @useResult
  $Res call(
      {UniqueId id,
      DateTime date,
      IList<MovementEntity> movements,
      Option<TemplateEntity> template});
}

/// @nodoc
class _$WorkoutEntityCopyWithImpl<$Res, $Val extends WorkoutEntity>
    implements $WorkoutEntityCopyWith<$Res> {
  _$WorkoutEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? movements = null,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      movements: null == movements
          ? _value.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as IList<MovementEntity>,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as Option<TemplateEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutEntityCopyWith<$Res>
    implements $WorkoutEntityCopyWith<$Res> {
  factory _$$_WorkoutEntityCopyWith(
          _$_WorkoutEntity value, $Res Function(_$_WorkoutEntity) then) =
      __$$_WorkoutEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      DateTime date,
      IList<MovementEntity> movements,
      Option<TemplateEntity> template});
}

/// @nodoc
class __$$_WorkoutEntityCopyWithImpl<$Res>
    extends _$WorkoutEntityCopyWithImpl<$Res, _$_WorkoutEntity>
    implements _$$_WorkoutEntityCopyWith<$Res> {
  __$$_WorkoutEntityCopyWithImpl(
      _$_WorkoutEntity _value, $Res Function(_$_WorkoutEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? movements = null,
    Object? template = null,
  }) {
    return _then(_$_WorkoutEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      movements: null == movements
          ? _value.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as IList<MovementEntity>,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as Option<TemplateEntity>,
    ));
  }
}

/// @nodoc

class _$_WorkoutEntity implements _WorkoutEntity {
  const _$_WorkoutEntity(
      {required this.id,
      required this.date,
      required this.movements,
      required this.template});

  @override
  final UniqueId id;
  @override
  final DateTime date;
  @override
  final IList<MovementEntity> movements;
  @override
  final Option<TemplateEntity> template;

  @override
  String toString() {
    return 'WorkoutEntity(id: $id, date: $date, movements: $movements, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.movements, movements) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date,
      const DeepCollectionEquality().hash(movements), template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutEntityCopyWith<_$_WorkoutEntity> get copyWith =>
      __$$_WorkoutEntityCopyWithImpl<_$_WorkoutEntity>(this, _$identity);
}

abstract class _WorkoutEntity implements WorkoutEntity {
  const factory _WorkoutEntity(
      {required final UniqueId id,
      required final DateTime date,
      required final IList<MovementEntity> movements,
      required final Option<TemplateEntity> template}) = _$_WorkoutEntity;

  @override
  UniqueId get id;
  @override
  DateTime get date;
  @override
  IList<MovementEntity> get movements;
  @override
  Option<TemplateEntity> get template;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutEntityCopyWith<_$_WorkoutEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
