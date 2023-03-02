import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/core/infrastructure/fast_hash.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/failures/template_failure.dart';
import 'package:jumpat/features/workout/domain/repositories/i_template_repository.dart';
import 'package:jumpat/features/workout/infrastructure/models/collections.dart';
import 'package:jumpat/features/workout/infrastructure/repositories/template_entity_converter.dart';

class TemplateRepository implements ITemplateRepository {
  const TemplateRepository({required this.client});

  final Isar client;

  @override
  Future<Either<TemplateFailure, Unit>> update(TemplateEntity template) async {
    await client.writeTxn(
      () async {
        final t = TemplateEntityConverter().toInfra(template);
        await client.templates.put(t);
        await t.exercises.save();
      },
    );
    return right(unit);
  }

  @override
  Future<IList<TemplateEntity>> getAll() async {
    final templates = await client.templates.where().findAll();
    return templates.map(TemplateEntityConverter().toDomain).toIList();
  }

  @override
  Future<Option<TemplateEntity>> get(UniqueId id) async {
    final template = await client.templates.get(fastHash(id.getOrCrash()));
    return Option.fromNullable(template)
        .map(TemplateEntityConverter().toDomain);
  }

  @override
  Future<Either<TemplateFailure, Unit>> delete(TemplateEntity template) async {
    await client.writeTxn(
      () async => client.templates.delete(fastHash(template.id.getOrCrash())),
    );
    return right(unit);
  }
}
