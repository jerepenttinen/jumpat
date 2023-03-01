import 'package:isar/isar.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:fpdart/src/unit.dart';
import 'package:fpdart/src/either.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';

class TemplateRepository implements ITemplateRepository {
  const TemplateRepository({required this.client});

  final Isar client;

  @override
  Future<Either<TemplateFailure, int>> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<Either<TemplateFailure, Unit>> create(TemplateEntity template) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<TemplateFailure, Unit>> update(TemplateEntity template) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<TemplateFailure, IList<TemplateEntity>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }

  @override
  Stream<Either<TemplateFailure, TemplateEntity>> watchOne(UniqueId id) {
    // TODO: implement watchOne
    throw UnimplementedError();
  }
}
