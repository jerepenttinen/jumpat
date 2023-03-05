// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movementsHash() => r'c14c59f61d6f72f3b80f6c88177d3ac553f72b74';

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

abstract class _$Movements
    extends BuildlessAsyncNotifier<IList<MovementEntity>> {
  late final UniqueId workoutId;

  Future<IList<MovementEntity>> build({
    required UniqueId workoutId,
  });
}

/// See also [Movements].
@ProviderFor(Movements)
const movementsProvider = MovementsFamily();

/// See also [Movements].
class MovementsFamily extends Family<AsyncValue<IList<MovementEntity>>> {
  /// See also [Movements].
  const MovementsFamily();

  /// See also [Movements].
  MovementsProvider call({
    required UniqueId workoutId,
  }) {
    return MovementsProvider(
      workoutId: workoutId,
    );
  }

  @override
  MovementsProvider getProviderOverride(
    covariant MovementsProvider provider,
  ) {
    return call(
      workoutId: provider.workoutId,
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
  String? get name => r'movementsProvider';
}

/// See also [Movements].
class MovementsProvider
    extends AsyncNotifierProviderImpl<Movements, IList<MovementEntity>> {
  /// See also [Movements].
  MovementsProvider({
    required this.workoutId,
  }) : super.internal(
          () => Movements()..workoutId = workoutId,
          from: movementsProvider,
          name: r'movementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movementsHash,
          dependencies: MovementsFamily._dependencies,
          allTransitiveDependencies: MovementsFamily._allTransitiveDependencies,
        );

  final UniqueId workoutId;

  @override
  bool operator ==(Object other) {
    return other is MovementsProvider && other.workoutId == workoutId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workoutId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<IList<MovementEntity>> runNotifierBuild(
    covariant Movements notifier,
  ) {
    return notifier.build(
      workoutId: workoutId,
    );
  }
}

String _$movementStateHash() => r'b075f8699f56b98da8df286f0e89b48f1ee1d265';

abstract class _$MovementState
    extends BuildlessAsyncNotifier<Option<MovementEntity>> {
  late final UniqueId id;

  Future<Option<MovementEntity>> build({
    required UniqueId id,
  });
}

/// See also [MovementState].
@ProviderFor(MovementState)
const movementStateProvider = MovementStateFamily();

/// See also [MovementState].
class MovementStateFamily extends Family<AsyncValue<Option<MovementEntity>>> {
  /// See also [MovementState].
  const MovementStateFamily();

  /// See also [MovementState].
  MovementStateProvider call({
    required UniqueId id,
  }) {
    return MovementStateProvider(
      id: id,
    );
  }

  @override
  MovementStateProvider getProviderOverride(
    covariant MovementStateProvider provider,
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
  String? get name => r'movementStateProvider';
}

/// See also [MovementState].
class MovementStateProvider
    extends AsyncNotifierProviderImpl<MovementState, Option<MovementEntity>> {
  /// See also [MovementState].
  MovementStateProvider({
    required this.id,
  }) : super.internal(
          () => MovementState()..id = id,
          from: movementStateProvider,
          name: r'movementStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movementStateHash,
          dependencies: MovementStateFamily._dependencies,
          allTransitiveDependencies:
              MovementStateFamily._allTransitiveDependencies,
        );

  final UniqueId id;

  @override
  bool operator ==(Object other) {
    return other is MovementStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Option<MovementEntity>> runNotifierBuild(
    covariant MovementState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}

String _$exerciseMovementsHash() => r'7349c99ac1e96bf1a1008b0a7850d683dae9dde6';

abstract class _$ExerciseMovements
    extends BuildlessAutoDisposeAsyncNotifier<IList<MovementEntity>> {
  late final ExerciseEntity exercise;

  Future<IList<MovementEntity>> build({
    required ExerciseEntity exercise,
  });
}

/// See also [ExerciseMovements].
@ProviderFor(ExerciseMovements)
const exerciseMovementsProvider = ExerciseMovementsFamily();

/// See also [ExerciseMovements].
class ExerciseMovementsFamily
    extends Family<AsyncValue<IList<MovementEntity>>> {
  /// See also [ExerciseMovements].
  const ExerciseMovementsFamily();

  /// See also [ExerciseMovements].
  ExerciseMovementsProvider call({
    required ExerciseEntity exercise,
  }) {
    return ExerciseMovementsProvider(
      exercise: exercise,
    );
  }

  @override
  ExerciseMovementsProvider getProviderOverride(
    covariant ExerciseMovementsProvider provider,
  ) {
    return call(
      exercise: provider.exercise,
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
  String? get name => r'exerciseMovementsProvider';
}

/// See also [ExerciseMovements].
class ExerciseMovementsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExerciseMovements, IList<MovementEntity>> {
  /// See also [ExerciseMovements].
  ExerciseMovementsProvider({
    required this.exercise,
  }) : super.internal(
          () => ExerciseMovements()..exercise = exercise,
          from: exerciseMovementsProvider,
          name: r'exerciseMovementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseMovementsHash,
          dependencies: ExerciseMovementsFamily._dependencies,
          allTransitiveDependencies:
              ExerciseMovementsFamily._allTransitiveDependencies,
        );

  final ExerciseEntity exercise;

  @override
  bool operator ==(Object other) {
    return other is ExerciseMovementsProvider && other.exercise == exercise;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exercise.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<IList<MovementEntity>> runNotifierBuild(
    covariant ExerciseMovements notifier,
  ) {
    return notifier.build(
      exercise: exercise,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
