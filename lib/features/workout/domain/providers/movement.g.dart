// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

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

String _$MovementsHash() => r'd26c2da5f359e203190a8d3665f9d9b091ea59e1';

/// See also [Movements].
class MovementsProvider
    extends AsyncNotifierProviderImpl<Movements, IList<MovementEntity>> {
  MovementsProvider({
    required this.workoutId,
  }) : super(
          () => Movements()..workoutId = workoutId,
          from: movementsProvider,
          name: r'movementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$MovementsHash,
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
  FutureOr<IList<MovementEntity>> runNotifierBuild(
    covariant _$Movements notifier,
  ) {
    return notifier.build(
      workoutId: workoutId,
    );
  }
}

typedef MovementsRef = AsyncNotifierProviderRef<IList<MovementEntity>>;

/// See also [Movements].
final movementsProvider = MovementsFamily();

class MovementsFamily extends Family<AsyncValue<IList<MovementEntity>>> {
  MovementsFamily();

  MovementsProvider call({
    required UniqueId workoutId,
  }) {
    return MovementsProvider(
      workoutId: workoutId,
    );
  }

  @override
  AsyncNotifierProviderImpl<Movements, IList<MovementEntity>>
      getProviderOverride(
    covariant MovementsProvider provider,
  ) {
    return call(
      workoutId: provider.workoutId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'movementsProvider';
}

abstract class _$Movements
    extends BuildlessAsyncNotifier<IList<MovementEntity>> {
  late final UniqueId workoutId;

  FutureOr<IList<MovementEntity>> build({
    required UniqueId workoutId,
  });
}

String _$MovementStateHash() => r'2c422c320744d88c5876bc2223fd73ed1d890ed7';

/// See also [MovementState].
class MovementStateProvider
    extends AsyncNotifierProviderImpl<MovementState, MovementEntity> {
  MovementStateProvider({
    required this.id,
  }) : super(
          () => MovementState()..id = id,
          from: movementStateProvider,
          name: r'movementStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$MovementStateHash,
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
  FutureOr<MovementEntity> runNotifierBuild(
    covariant _$MovementState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}

typedef MovementStateRef = AsyncNotifierProviderRef<MovementEntity>;

/// See also [MovementState].
final movementStateProvider = MovementStateFamily();

class MovementStateFamily extends Family<AsyncValue<MovementEntity>> {
  MovementStateFamily();

  MovementStateProvider call({
    required UniqueId id,
  }) {
    return MovementStateProvider(
      id: id,
    );
  }

  @override
  AsyncNotifierProviderImpl<MovementState, MovementEntity> getProviderOverride(
    covariant MovementStateProvider provider,
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
  String? get name => r'movementStateProvider';
}

abstract class _$MovementState extends BuildlessAsyncNotifier<MovementEntity> {
  late final UniqueId id;

  FutureOr<MovementEntity> build({
    required UniqueId id,
  });
}
