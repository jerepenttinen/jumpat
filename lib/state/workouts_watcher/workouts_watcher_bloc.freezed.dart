// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workouts_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutsWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchWorkouts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchWorkouts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchWorkouts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchWorkouts value) watchWorkouts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchWorkouts value)? watchWorkouts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchWorkouts value)? watchWorkouts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutsWatcherEventCopyWith<$Res> {
  factory $WorkoutsWatcherEventCopyWith(WorkoutsWatcherEvent value,
          $Res Function(WorkoutsWatcherEvent) then) =
      _$WorkoutsWatcherEventCopyWithImpl<$Res, WorkoutsWatcherEvent>;
}

/// @nodoc
class _$WorkoutsWatcherEventCopyWithImpl<$Res,
        $Val extends WorkoutsWatcherEvent>
    implements $WorkoutsWatcherEventCopyWith<$Res> {
  _$WorkoutsWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WatchWorkoutsCopyWith<$Res> {
  factory _$$_WatchWorkoutsCopyWith(
          _$_WatchWorkouts value, $Res Function(_$_WatchWorkouts) then) =
      __$$_WatchWorkoutsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WatchWorkoutsCopyWithImpl<$Res>
    extends _$WorkoutsWatcherEventCopyWithImpl<$Res, _$_WatchWorkouts>
    implements _$$_WatchWorkoutsCopyWith<$Res> {
  __$$_WatchWorkoutsCopyWithImpl(
      _$_WatchWorkouts _value, $Res Function(_$_WatchWorkouts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_WatchWorkouts implements _WatchWorkouts {
  const _$_WatchWorkouts();

  @override
  String toString() {
    return 'WorkoutsWatcherEvent.watchWorkouts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WatchWorkouts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchWorkouts,
  }) {
    return watchWorkouts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchWorkouts,
  }) {
    return watchWorkouts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchWorkouts,
    required TResult orElse(),
  }) {
    if (watchWorkouts != null) {
      return watchWorkouts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchWorkouts value) watchWorkouts,
  }) {
    return watchWorkouts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchWorkouts value)? watchWorkouts,
  }) {
    return watchWorkouts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchWorkouts value)? watchWorkouts,
    required TResult orElse(),
  }) {
    if (watchWorkouts != null) {
      return watchWorkouts(this);
    }
    return orElse();
  }
}

abstract class _WatchWorkouts implements WorkoutsWatcherEvent {
  const factory _WatchWorkouts() = _$_WatchWorkouts;
}

/// @nodoc
mixin _$WorkoutsWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Workout> workouts) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Workout> workouts)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Workout> workouts)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadSuccess value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutsWatcherStateCopyWith<$Res> {
  factory $WorkoutsWatcherStateCopyWith(WorkoutsWatcherState value,
          $Res Function(WorkoutsWatcherState) then) =
      _$WorkoutsWatcherStateCopyWithImpl<$Res, WorkoutsWatcherState>;
}

/// @nodoc
class _$WorkoutsWatcherStateCopyWithImpl<$Res,
        $Val extends WorkoutsWatcherState>
    implements $WorkoutsWatcherStateCopyWith<$Res> {
  _$WorkoutsWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$WorkoutsWatcherStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WorkoutsWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Workout> workouts) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Workout> workouts)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Workout> workouts)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadSuccess value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WorkoutsWatcherState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadSuccessCopyWith<$Res> {
  factory _$$LoadSuccessCopyWith(
          _$LoadSuccess value, $Res Function(_$LoadSuccess) then) =
      __$$LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Workout> workouts});
}

/// @nodoc
class __$$LoadSuccessCopyWithImpl<$Res>
    extends _$WorkoutsWatcherStateCopyWithImpl<$Res, _$LoadSuccess>
    implements _$$LoadSuccessCopyWith<$Res> {
  __$$LoadSuccessCopyWithImpl(
      _$LoadSuccess _value, $Res Function(_$LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
  }) {
    return _then(_$LoadSuccess(
      null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(final List<Workout> workouts) : _workouts = workouts;

  final List<Workout> _workouts;
  @override
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'WorkoutsWatcherState.loaded(workouts: $workouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccess &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      __$$LoadSuccessCopyWithImpl<_$LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Workout> workouts) loaded,
  }) {
    return loaded(workouts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Workout> workouts)? loaded,
  }) {
    return loaded?.call(workouts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Workout> workouts)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(workouts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadSuccess value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadSuccess value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadSuccess value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements WorkoutsWatcherState {
  const factory LoadSuccess(final List<Workout> workouts) = _$LoadSuccess;

  List<Workout> get workouts;
  @JsonKey(ignore: true)
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
