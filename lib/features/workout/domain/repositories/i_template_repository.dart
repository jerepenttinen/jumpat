import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';

abstract class ITemplateRepository {
  Stream<Either<TemplateFailure, IList<TemplateEntity>>> watchAll();
  Stream<Either<TemplateFailure, TemplateEntity>> watchOne(UniqueId id);
  Future<Either<TemplateFailure, Unit>> create(TemplateEntity template);
  Future<Either<TemplateFailure, Unit>> update(TemplateEntity template);
  Future<Either<TemplateFailure, int>> count();
}
