// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutsHash() => r'4738c9aba7af9969d6ff04a152b8539478415982';

/// See also [Workouts].
@ProviderFor(Workouts)
final workoutsProvider =
    AsyncNotifierProvider<Workouts, IList<WorkoutEntity>>.internal(
  Workouts.new,
  name: r'workoutsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$workoutsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Workouts = AsyncNotifier<IList<WorkoutEntity>>;
String _$workoutStateHash() => r'666cd5592c4abaa72f250b6644745365752215d3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WorkoutState
    extends BuildlessAsyncNotifier<Option<WorkoutEntity>> {
  late final UniqueId id;

  Future<Option<WorkoutEntity>> build({
    required UniqueId id,
  });
}

/// See also [WorkoutState].
@ProviderFor(WorkoutState)
const workoutStateProvider = WorkoutStateFamily();

/// See also [WorkoutState].
class WorkoutStateFamily extends Family<AsyncValue<Option<WorkoutEntity>>> {
  /// See also [WorkoutState].
  const WorkoutStateFamily();

  /// See also [WorkoutState].
  WorkoutStateProvider call({
    required UniqueId id,
  }) {
    return WorkoutStateProvider(
      id: id,
    );
  }

  @override
  WorkoutStateProvider getProviderOverride(
    covariant WorkoutStateProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutStateProvider';
}

/// See also [WorkoutState].
class WorkoutStateProvider
    extends AsyncNotifierProviderImpl<WorkoutState, Option<WorkoutEntity>> {
  /// See also [WorkoutState].
  WorkoutStateProvider({
    required this.id,
  }) : super.internal(
          () => WorkoutState()..id = id,
          from: workoutStateProvider,
          name: r'workoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutStateHash,
          dependencies: WorkoutStateFamily._dependencies,
          allTransitiveDependencies:
              WorkoutStateFamily._allTransitiveDependencies,
        );

  final UniqueId id;

  @override
  bool operator ==(Object other) {
    return other is WorkoutStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Option<WorkoutEntity>> runNotifierBuild(
    covariant WorkoutState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
