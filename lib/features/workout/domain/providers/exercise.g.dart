// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exercisesHash() => r'9939cf5bb8a0fa6b86a84198d95b3e50dfa10f93';

/// See also [Exercises].
@ProviderFor(Exercises)
final exercisesProvider =
    AsyncNotifierProvider<Exercises, IList<ExerciseEntity>>.internal(
  Exercises.new,
  name: r'exercisesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$exercisesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Exercises = AsyncNotifier<IList<ExerciseEntity>>;
String _$exerciseStateHash() => r'd1e46ece0181d3541c903d16bcfb56ead9ac5545';

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

abstract class _$ExerciseState extends BuildlessAsyncNotifier<ExerciseEntity> {
  late final UniqueId id;

  Future<ExerciseEntity> build({
    required UniqueId id,
  });
}

/// See also [ExerciseState].
@ProviderFor(ExerciseState)
const exerciseStateProvider = ExerciseStateFamily();

/// See also [ExerciseState].
class ExerciseStateFamily extends Family<AsyncValue<ExerciseEntity>> {
  /// See also [ExerciseState].
  const ExerciseStateFamily();

  /// See also [ExerciseState].
  ExerciseStateProvider call({
    required UniqueId id,
  }) {
    return ExerciseStateProvider(
      id: id,
    );
  }

  @override
  ExerciseStateProvider getProviderOverride(
    covariant ExerciseStateProvider provider,
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
  String? get name => r'exerciseStateProvider';
}

/// See also [ExerciseState].
class ExerciseStateProvider
    extends AsyncNotifierProviderImpl<ExerciseState, ExerciseEntity> {
  /// See also [ExerciseState].
  ExerciseStateProvider({
    required this.id,
  }) : super.internal(
          () => ExerciseState()..id = id,
          from: exerciseStateProvider,
          name: r'exerciseStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseStateHash,
          dependencies: ExerciseStateFamily._dependencies,
          allTransitiveDependencies:
              ExerciseStateFamily._allTransitiveDependencies,
        );

  final UniqueId id;

  @override
  bool operator ==(Object other) {
    return other is ExerciseStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<ExerciseEntity> runNotifierBuild(
    covariant ExerciseState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
