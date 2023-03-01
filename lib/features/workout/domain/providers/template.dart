import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template.g.dart';

@Riverpod(keepAlive: true)
class Templates extends _$Templates {
  @override
  Future<IList<TemplateEntity>> build() async {
    final repository = ref.watch(templateRepositoryProvider);

    final templates = await repository.getAll();
    return templates.sortOrdered(templateEntityComparator);
  }

  Future<void> save(TemplateEntity template) async {
    final repository = ref.watch(templateRepositoryProvider);
    await repository.update(template);

    await update((currentList) {
      return currentList.updateById(
        [template],
        (item) => item.id,
      ).sortOrdered(templateEntityComparator);
    });
  }
}

@Riverpod(keepAlive: true)
class TemplateState extends _$TemplateState {
  @override
  Future<TemplateEntity> build({required UniqueId id}) async {
    final repository = ref.watch(templateRepositoryProvider);
    final template = await repository.get(id);
    // TODO: handle better
    return template.toNullable()!;
  }
}
