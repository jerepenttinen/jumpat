import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';

abstract class ITemplateRepository {
  Future<IList<TemplateEntity>> getAll();
  Future<Option<TemplateEntity>> get(UniqueId id);
  Future<Either<TemplateFailure, Unit>> save(TemplateEntity template);
  Future<Either<TemplateFailure, Unit>> remove(TemplateEntity template);
}
