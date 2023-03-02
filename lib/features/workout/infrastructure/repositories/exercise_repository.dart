import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/failures/exercise_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/exercise_entity_converter.dart';

class ExerciseRepository implements IExerciseRepository {
  const ExerciseRepository({required this.client});

  final Isar client;

  @override
  Future<IList<ExerciseEntity>> getAll() async {
    final exercises = await client.exercises.where().findAll();
    return exercises
        .map((exercise) => ExerciseEntityConverter().toDomain(exercise))
        .toIList();
  }

  @override
  Future<Either<ExerciseFailure, Unit>> update(ExerciseEntity exercise) async {
    await client.writeTxn(
      () => client.exercises.put(ExerciseEntityConverter().toInfra(exercise)),
    );

    return const Right(unit);
  }

  @override
  Future<Either<ExerciseFailure, ExerciseEntity>> get(UniqueId id) async {
    final exercise = await client.exercises.get(fastHash(id.getOrCrash()));
    if (exercise != null) {
      return right(ExerciseEntityConverter().toDomain(exercise));
    } else {
      return left(const ExerciseFailure.notFound());
    }
  }
}
