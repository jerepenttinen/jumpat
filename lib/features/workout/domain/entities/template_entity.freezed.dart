// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TemplateEntity {
  UniqueId get id => throw _privateConstructorUsedError;
  TemplateName get name => throw _privateConstructorUsedError;
  TemplateColor get color => throw _privateConstructorUsedError;
  IList<ExerciseEntity> get exercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateEntityCopyWith<TemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateEntityCopyWith<$Res> {
  factory $TemplateEntityCopyWith(
          TemplateEntity value, $Res Function(TemplateEntity) then) =
      _$TemplateEntityCopyWithImpl<$Res, TemplateEntity>;
  @useResult
  $Res call(
      {UniqueId id,
      TemplateName name,
      TemplateColor color,
      IList<ExerciseEntity> exercises});
}

/// @nodoc
class _$TemplateEntityCopyWithImpl<$Res, $Val extends TemplateEntity>
    implements $TemplateEntityCopyWith<$Res> {
  _$TemplateEntityCopyWithImpl(this._value, this._then);

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
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TemplateColor,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as IList<ExerciseEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateEntityCopyWith<$Res>
    implements $TemplateEntityCopyWith<$Res> {
  factory _$$_TemplateEntityCopyWith(
          _$_TemplateEntity value, $Res Function(_$_TemplateEntity) then) =
      __$$_TemplateEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      TemplateName name,
      TemplateColor color,
      IList<ExerciseEntity> exercises});
}

/// @nodoc
class __$$_TemplateEntityCopyWithImpl<$Res>
    extends _$TemplateEntityCopyWithImpl<$Res, _$_TemplateEntity>
    implements _$$_TemplateEntityCopyWith<$Res> {
  __$$_TemplateEntityCopyWithImpl(
      _$_TemplateEntity _value, $Res Function(_$_TemplateEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? exercises = null,
  }) {
    return _then(_$_TemplateEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TemplateColor,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as IList<ExerciseEntity>,
    ));
  }
}

/// @nodoc

class _$_TemplateEntity implements _TemplateEntity {
  const _$_TemplateEntity(
      {required this.id,
      required this.name,
      required this.color,
      required this.exercises});

  @override
  final UniqueId id;
  @override
  final TemplateName name;
  @override
  final TemplateColor color;
  @override
  final IList<ExerciseEntity> exercises;

  @override
  String toString() {
    return 'TemplateEntity(id: $id, name: $name, color: $color, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateEntity &&
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
  _$$_TemplateEntityCopyWith<_$_TemplateEntity> get copyWith =>
      __$$_TemplateEntityCopyWithImpl<_$_TemplateEntity>(this, _$identity);
}

abstract class _TemplateEntity implements TemplateEntity {
  const factory _TemplateEntity(
      {required final UniqueId id,
      required final TemplateName name,
      required final TemplateColor color,
      required final IList<ExerciseEntity> exercises}) = _$_TemplateEntity;

  @override
  UniqueId get id;
  @override
  TemplateName get name;
  @override
  TemplateColor get color;
  @override
  IList<ExerciseEntity> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateEntityCopyWith<_$_TemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
