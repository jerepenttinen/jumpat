// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

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

String _$isarInstanceHash() => r'a61204c6188b24b4425a0a640c6c4fcd50f584b7';

/// See also [isarInstance].
final isarInstanceProvider = FutureProvider<Isar>(
  isarInstance,
  name: r'isarInstanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarInstanceHash,
);
typedef IsarInstanceRef = FutureProviderRef<Isar>;
String _$isarServiceHash() => r'531b1dd6af2e5f70653f705cb6ec5b5d1e7a2ef8';

/// See also [isarService].
final isarServiceProvider = AutoDisposeFutureProvider<IsarService>(
  isarService,
  name: r'isarServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarServiceHash,
);
typedef IsarServiceRef = AutoDisposeFutureProviderRef<IsarService>;
String _$deleteWorkoutHash() => r'b4248d62b4254ec4321e193153b5782c1836afcb';

/// See also [deleteWorkout].
class DeleteWorkoutProvider extends AutoDisposeFutureProvider<void> {
  DeleteWorkoutProvider(
    this.workout,
  ) : super(
          (ref) => deleteWorkout(
            ref,
            workout,
          ),
          from: deleteWorkoutProvider,
          name: r'deleteWorkoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteWorkoutHash,
        );

  final Workout workout;

  @override
  bool operator ==(Object other) {
    return other is DeleteWorkoutProvider && other.workout == workout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workout.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DeleteWorkoutRef = AutoDisposeFutureProviderRef<void>;

/// See also [deleteWorkout].
final deleteWorkoutProvider = DeleteWorkoutFamily();

class DeleteWorkoutFamily extends Family<AsyncValue<void>> {
  DeleteWorkoutFamily();

  DeleteWorkoutProvider call(
    Workout workout,
  ) {
    return DeleteWorkoutProvider(
      workout,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant DeleteWorkoutProvider provider,
  ) {
    return call(
      provider.workout,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'deleteWorkoutProvider';
}

String _$deleteMovementHash() => r'ea18732c844d00caa93a89b31a21989a99e1e916';

/// See also [deleteMovement].
class DeleteMovementProvider extends AutoDisposeFutureProvider<void> {
  DeleteMovementProvider(
    this.movement,
  ) : super(
          (ref) => deleteMovement(
            ref,
            movement,
          ),
          from: deleteMovementProvider,
          name: r'deleteMovementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMovementHash,
        );

  final Movement movement;

  @override
  bool operator ==(Object other) {
    return other is DeleteMovementProvider && other.movement == movement;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movement.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DeleteMovementRef = AutoDisposeFutureProviderRef<void>;

/// See also [deleteMovement].
final deleteMovementProvider = DeleteMovementFamily();

class DeleteMovementFamily extends Family<AsyncValue<void>> {
  DeleteMovementFamily();

  DeleteMovementProvider call(
    Movement movement,
  ) {
    return DeleteMovementProvider(
      movement,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant DeleteMovementProvider provider,
  ) {
    return call(
      provider.movement,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'deleteMovementProvider';
}

String _$saveWorkoutHash() => r'ef5d320e891579db74cf7056e3a2884f256ad2c6';

/// See also [saveWorkout].
class SaveWorkoutProvider extends AutoDisposeFutureProvider<Workout> {
  SaveWorkoutProvider({
    required this.workout,
  }) : super(
          (ref) => saveWorkout(
            ref,
            workout: workout,
          ),
          from: saveWorkoutProvider,
          name: r'saveWorkoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveWorkoutHash,
        );

  final Workout workout;

  @override
  bool operator ==(Object other) {
    return other is SaveWorkoutProvider && other.workout == workout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workout.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SaveWorkoutRef = AutoDisposeFutureProviderRef<Workout>;

/// See also [saveWorkout].
final saveWorkoutProvider = SaveWorkoutFamily();

class SaveWorkoutFamily extends Family<AsyncValue<Workout>> {
  SaveWorkoutFamily();

  SaveWorkoutProvider call({
    required Workout workout,
  }) {
    return SaveWorkoutProvider(
      workout: workout,
    );
  }

  @override
  AutoDisposeFutureProvider<Workout> getProviderOverride(
    covariant SaveWorkoutProvider provider,
  ) {
    return call(
      workout: provider.workout,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'saveWorkoutProvider';
}

String _$saveMovementHash() => r'3ae8042913cefdfee2b418d389accbdecc3feb31';

/// See also [saveMovement].
class SaveMovementProvider extends AutoDisposeFutureProvider<Movement> {
  SaveMovementProvider(
    this.movement,
  ) : super(
          (ref) => saveMovement(
            ref,
            movement,
          ),
          from: saveMovementProvider,
          name: r'saveMovementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveMovementHash,
        );

  final Movement movement;

  @override
  bool operator ==(Object other) {
    return other is SaveMovementProvider && other.movement == movement;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movement.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SaveMovementRef = AutoDisposeFutureProviderRef<Movement>;

/// See also [saveMovement].
final saveMovementProvider = SaveMovementFamily();

class SaveMovementFamily extends Family<AsyncValue<Movement>> {
  SaveMovementFamily();

  SaveMovementProvider call(
    Movement movement,
  ) {
    return SaveMovementProvider(
      movement,
    );
  }

  @override
  AutoDisposeFutureProvider<Movement> getProviderOverride(
    covariant SaveMovementProvider provider,
  ) {
    return call(
      provider.movement,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'saveMovementProvider';
}

String _$createMovementHash() => r'65b8b7a7b192cb9f0d04ce2f3881f47156a4ca5a';

/// See also [createMovement].
class CreateMovementProvider extends AutoDisposeFutureProvider<Movement> {
  CreateMovementProvider(
    this.workout,
    this.exercise,
  ) : super(
          (ref) => createMovement(
            ref,
            workout,
            exercise,
          ),
          from: createMovementProvider,
          name: r'createMovementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createMovementHash,
        );

  final Workout workout;
  final Exercise exercise;

  @override
  bool operator ==(Object other) {
    return other is CreateMovementProvider &&
        other.workout == workout &&
        other.exercise == exercise;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workout.hashCode);
    hash = _SystemHash.combine(hash, exercise.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CreateMovementRef = AutoDisposeFutureProviderRef<Movement>;

/// See also [createMovement].
final createMovementProvider = CreateMovementFamily();

class CreateMovementFamily extends Family<AsyncValue<Movement>> {
  CreateMovementFamily();

  CreateMovementProvider call(
    Workout workout,
    Exercise exercise,
  ) {
    return CreateMovementProvider(
      workout,
      exercise,
    );
  }

  @override
  AutoDisposeFutureProvider<Movement> getProviderOverride(
    covariant CreateMovementProvider provider,
  ) {
    return call(
      provider.workout,
      provider.exercise,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'createMovementProvider';
}

String _$saveExerciseHash() => r'5242da1743b88a9f97a35fb68c5016e3056b6df1';

/// See also [saveExercise].
class SaveExerciseProvider extends AutoDisposeFutureProvider<int> {
  SaveExerciseProvider(
    this.exercise,
  ) : super(
          (ref) => saveExercise(
            ref,
            exercise,
          ),
          from: saveExerciseProvider,
          name: r'saveExerciseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveExerciseHash,
        );

  final Exercise exercise;

  @override
  bool operator ==(Object other) {
    return other is SaveExerciseProvider && other.exercise == exercise;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exercise.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SaveExerciseRef = AutoDisposeFutureProviderRef<int>;

/// See also [saveExercise].
final saveExerciseProvider = SaveExerciseFamily();

class SaveExerciseFamily extends Family<AsyncValue<int>> {
  SaveExerciseFamily();

  SaveExerciseProvider call(
    Exercise exercise,
  ) {
    return SaveExerciseProvider(
      exercise,
    );
  }

  @override
  AutoDisposeFutureProvider<int> getProviderOverride(
    covariant SaveExerciseProvider provider,
  ) {
    return call(
      provider.exercise,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'saveExerciseProvider';
}

String _$searchExercisesHash() => r'141e5b46afb76778db6474e052b555a096f3b90a';

/// See also [searchExercises].
class SearchExercisesProvider
    extends AutoDisposeFutureProvider<List<Exercise>> {
  SearchExercisesProvider(
    this.term,
  ) : super(
          (ref) => searchExercises(
            ref,
            term,
          ),
          from: searchExercisesProvider,
          name: r'searchExercisesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchExercisesHash,
        );

  final String term;

  @override
  bool operator ==(Object other) {
    return other is SearchExercisesProvider && other.term == term;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, term.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SearchExercisesRef = AutoDisposeFutureProviderRef<List<Exercise>>;

/// See also [searchExercises].
final searchExercisesProvider = SearchExercisesFamily();

class SearchExercisesFamily extends Family<AsyncValue<List<Exercise>>> {
  SearchExercisesFamily();

  SearchExercisesProvider call(
    String term,
  ) {
    return SearchExercisesProvider(
      term,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Exercise>> getProviderOverride(
    covariant SearchExercisesProvider provider,
  ) {
    return call(
      provider.term,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'searchExercisesProvider';
}

String _$createExerciseHash() => r'3296042a413efac4db4418cab7ea9de798160912';

/// See also [createExercise].
class CreateExerciseProvider extends AutoDisposeFutureProvider<Exercise> {
  CreateExerciseProvider(
    this.name,
  ) : super(
          (ref) => createExercise(
            ref,
            name,
          ),
          from: createExerciseProvider,
          name: r'createExerciseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createExerciseHash,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is CreateExerciseProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CreateExerciseRef = AutoDisposeFutureProviderRef<Exercise>;

/// See also [createExercise].
final createExerciseProvider = CreateExerciseFamily();

class CreateExerciseFamily extends Family<AsyncValue<Exercise>> {
  CreateExerciseFamily();

  CreateExerciseProvider call(
    String name,
  ) {
    return CreateExerciseProvider(
      name,
    );
  }

  @override
  AutoDisposeFutureProvider<Exercise> getProviderOverride(
    covariant CreateExerciseProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'createExerciseProvider';
}

String _$existsExerciseHash() => r'ab452a40795709e6df2be4150882cec5d2167405';

/// See also [existsExercise].
class ExistsExerciseProvider extends AutoDisposeFutureProvider<bool> {
  ExistsExerciseProvider(
    this.name,
  ) : super(
          (ref) => existsExercise(
            ref,
            name,
          ),
          from: existsExerciseProvider,
          name: r'existsExerciseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$existsExerciseHash,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is ExistsExerciseProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ExistsExerciseRef = AutoDisposeFutureProviderRef<bool>;

/// See also [existsExercise].
final existsExerciseProvider = ExistsExerciseFamily();

class ExistsExerciseFamily extends Family<AsyncValue<bool>> {
  ExistsExerciseFamily();

  ExistsExerciseProvider call(
    String name,
  ) {
    return ExistsExerciseProvider(
      name,
    );
  }

  @override
  AutoDisposeFutureProvider<bool> getProviderOverride(
    covariant ExistsExerciseProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'existsExerciseProvider';
}

String _$createTemplateHash() => r'20d40583289d83582790db5a96e57be612b8a0eb';

/// See also [createTemplate].
class CreateTemplateProvider extends AutoDisposeFutureProvider<Template> {
  CreateTemplateProvider(
    this.workout,
    this.name,
    this.color,
  ) : super(
          (ref) => createTemplate(
            ref,
            workout,
            name,
            color,
          ),
          from: createTemplateProvider,
          name: r'createTemplateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTemplateHash,
        );

  final Workout workout;
  final String name;
  final Color color;

  @override
  bool operator ==(Object other) {
    return other is CreateTemplateProvider &&
        other.workout == workout &&
        other.name == name &&
        other.color == color;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workout.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, color.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CreateTemplateRef = AutoDisposeFutureProviderRef<Template>;

/// See also [createTemplate].
final createTemplateProvider = CreateTemplateFamily();

class CreateTemplateFamily extends Family<AsyncValue<Template>> {
  CreateTemplateFamily();

  CreateTemplateProvider call(
    Workout workout,
    String name,
    Color color,
  ) {
    return CreateTemplateProvider(
      workout,
      name,
      color,
    );
  }

  @override
  AutoDisposeFutureProvider<Template> getProviderOverride(
    covariant CreateTemplateProvider provider,
  ) {
    return call(
      provider.workout,
      provider.name,
      provider.color,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'createTemplateProvider';
}

String _$existsAnyTemplatesHash() =>
    r'528bf1f70f41764336b7ca804ef3e87ccbb490b8';

/// See also [existsAnyTemplates].
final existsAnyTemplatesProvider = AutoDisposeFutureProvider<bool>(
  existsAnyTemplates,
  name: r'existsAnyTemplatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$existsAnyTemplatesHash,
);
typedef ExistsAnyTemplatesRef = AutoDisposeFutureProviderRef<bool>;
