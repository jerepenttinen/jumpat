import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';
import 'package:jumpat/features/workout/domain/entities/exercise_entity.dart';
import 'package:jumpat/features/workout/domain/failures/exercise_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_exercise_repository.dart';
import 'package:jumpat/features/workout/infrastructure/converters/exercise_converter.dart';

part 'exercise_repository.g.dart';

@DriftAccessor(tables: [Exercises])
class ExerciseRepository extends DatabaseAccessor<AppDatabase>
    with _$ExerciseRepositoryMixin
    implements IExerciseRepository {
  ExerciseRepository({required this.db}) : super(db);

  final AppDatabase db;

  @override
  Future<IList<ExerciseEntity>> getAll() async {
    final result = await (select(exercises)
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
    return result.map(ExerciseConverter().toDomain).toIList();
  }

  @override
  Future<Either<ExerciseFailure, Unit>> save(ExerciseEntity exercise) async {
    await db
        .into(exercises)
        .insertOnConflictUpdate(ExerciseConverter().toModel(exercise));

    return const Right(unit);
  }

  @override
  Future<Either<ExerciseFailure, ExerciseEntity>> get(UniqueId id) async {
    final result = await (db.select(exercises)
          ..where((exercise) => exercise.id.equals(id.getOrCrash())))
        .getSingleOrNull();

    if (result != null) {
      return right(ExerciseConverter().toDomain(result));
    } else {
      return left(const ExerciseFailure.notFound());
    }
  }
}
