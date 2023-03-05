// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$WorkoutsHash() => r'4738c9aba7af9969d6ff04a152b8539478415982';

/// See also [Workouts].
final workoutsProvider = AsyncNotifierProvider<Workouts, IList<WorkoutEntity>>(
  Workouts.new,
  name: r'workoutsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$WorkoutsHash,
);
typedef WorkoutsRef = AsyncNotifierProviderRef<IList<WorkoutEntity>>;

abstract class _$Workouts extends AsyncNotifier<IList<WorkoutEntity>> {
  @override
  FutureOr<IList<WorkoutEntity>> build();
}

String _$WorkoutStateHash() => r'38c9930644b92538baa8ba35fe900e66d6524161';

/// See also [WorkoutState].
class WorkoutStateProvider
    extends AsyncNotifierProviderImpl<WorkoutState, WorkoutEntity> {
  WorkoutStateProvider({
    required this.id,
  }) : super(
          () => WorkoutState()..id = id,
          from: workoutStateProvider,
          name: r'workoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$WorkoutStateHash,
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
  FutureOr<WorkoutEntity> runNotifierBuild(
    covariant _$WorkoutState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}

typedef WorkoutStateRef = AsyncNotifierProviderRef<WorkoutEntity>;

/// See also [WorkoutState].
final workoutStateProvider = WorkoutStateFamily();

class WorkoutStateFamily extends Family<AsyncValue<WorkoutEntity>> {
  WorkoutStateFamily();

  WorkoutStateProvider call({
    required UniqueId id,
  }) {
    return WorkoutStateProvider(
      id: id,
    );
  }

  @override
  AsyncNotifierProviderImpl<WorkoutState, WorkoutEntity> getProviderOverride(
    covariant WorkoutStateProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'workoutStateProvider';
}

abstract class _$WorkoutState extends BuildlessAsyncNotifier<WorkoutEntity> {
  late final UniqueId id;

  FutureOr<WorkoutEntity> build({
    required UniqueId id,
  });
}
