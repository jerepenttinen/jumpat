import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';
import 'package:jumpat/features/workout/presentation/widgets/slidable_edit_delete_item.dart';

class EditTemplatePage extends ConsumerWidget {
  const EditTemplatePage({required this.templateId, super.key});
  final UniqueId templateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templateAsync = ref.watch(templateStateProvider(id: templateId));
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: templateAsync.when(
        data: (template) {
          return ListView.builder(
            itemCount: template.exercises.length,
            itemBuilder: (context, index) {
              final exercise = template.exercises[index];
              return SlidableEditDeleteItem(
                onDelete: () async {
                  await ref.read(templatesProvider.notifier).remove(template);
                },
                onEdit: (context) async {
                  // context.router.push(EditMovementRoute(movementId: movement.id));
                },
                child: ListTile(
                  title: Text(exercise.name.getOrCrash()),
                ),
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text('$error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
