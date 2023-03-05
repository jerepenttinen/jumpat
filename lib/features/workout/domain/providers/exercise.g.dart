// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

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

String _$ExercisesHash() => r'19bb8c701f13c0c343b91f4a2adb132c373626aa';

/// See also [Exercises].
final exercisesProvider =
    AsyncNotifierProvider<Exercises, IList<ExerciseEntity>>(
  Exercises.new,
  name: r'exercisesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ExercisesHash,
);
typedef ExercisesRef = AsyncNotifierProviderRef<IList<ExerciseEntity>>;

abstract class _$Exercises extends AsyncNotifier<IList<ExerciseEntity>> {
  @override
  FutureOr<IList<ExerciseEntity>> build();
}

String _$ExerciseStateHash() => r'd1e46ece0181d3541c903d16bcfb56ead9ac5545';

/// See also [ExerciseState].
class ExerciseStateProvider
    extends AsyncNotifierProviderImpl<ExerciseState, ExerciseEntity> {
  ExerciseStateProvider({
    required this.id,
  }) : super(
          () => ExerciseState()..id = id,
          from: exerciseStateProvider,
          name: r'exerciseStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ExerciseStateHash,
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
  FutureOr<ExerciseEntity> runNotifierBuild(
    covariant _$ExerciseState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}

typedef ExerciseStateRef = AsyncNotifierProviderRef<ExerciseEntity>;

/// See also [ExerciseState].
final exerciseStateProvider = ExerciseStateFamily();

class ExerciseStateFamily extends Family<AsyncValue<ExerciseEntity>> {
  ExerciseStateFamily();

  ExerciseStateProvider call({
    required UniqueId id,
  }) {
    return ExerciseStateProvider(
      id: id,
    );
  }

  @override
  AsyncNotifierProviderImpl<ExerciseState, ExerciseEntity> getProviderOverride(
    covariant ExerciseStateProvider provider,
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
  String? get name => r'exerciseStateProvider';
}

abstract class _$ExerciseState extends BuildlessAsyncNotifier<ExerciseEntity> {
  late final UniqueId id;

  FutureOr<ExerciseEntity> build({
    required UniqueId id,
  });
}
