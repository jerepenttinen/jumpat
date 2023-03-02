import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';
import 'package:jumpat/features/workout/presentation/widgets/change_template_color.dart';
import 'package:jumpat/features/workout/presentation/widgets/change_template_name.dart';
import 'package:jumpat/features/workout/presentation/widgets/select_exercise_dialog.dart';
import 'package:jumpat/features/workout/presentation/widgets/slidable_edit_delete_item.dart';

class EditTemplatePage extends ConsumerWidget {
  const EditTemplatePage({required this.templateId, super.key});
  final UniqueId templateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templateAsync = ref.watch(templateStateProvider(id: templateId));
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: templateAsync.maybeWhen(
          data: (template) => Text(template.name.getOrCrash()),
          orElse: () => Text(t.exercises),
        ),
        actions: templateAsync.maybeWhen(
          data: (template) => [
            IconButton(
              icon: CircleColor(
                color: template.color.getOrCrash(),
                circleSize: 24,
              ),
              onPressed: () async {
                final newColor = await changeTemplateColorDialog(
                  context,
                  template.color,
                );

                if (newColor == null) {
                  return;
                }

                await ref
                    .read(templateStateProvider(id: templateId).notifier)
                    .updateColor(TemplateColor(newColor));
              },
            ),
            IconButton(
              onPressed: () async {
                final newName = await changeTemplateNameDialog(
                  context,
                  template.name,
                );

                if (newName == null) {
                  return;
                }

                await ref
                    .read(templateStateProvider(id: templateId).notifier)
                    .updateName(TemplateName(newName));
              },
              icon: const Icon(Icons.edit),
            )
          ],
          orElse: List.empty,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await selectExerciseDialog(context)
              .flatMap(
                (exercise) => TaskOption(() async {
                  await ref
                      .read(templateStateProvider(id: templateId).notifier)
                      .addExercise(exercise);
                  return some(unit);
                }),
              )
              .run();
        },
      ),
      body: templateAsync.when(
        data: (template) {
          return ListView.builder(
            itemCount: template.exercises.length,
            itemBuilder: (context, index) {
              final exercise = template.exercises[index];
              return SlidableEditDeleteItem(
                onDelete: () async {
                  await ref
                      .read(TemplateStateProvider(id: templateId).notifier)
                      .removeExercise(exercise);
                },
                onEdit: (context) async {
                  await selectExerciseDialog(context)
                      .flatMap(
                        (newExercise) => TaskOption(() async {
                          await ref
                              .read(
                                templateStateProvider(id: templateId).notifier,
                              )
                              .swapExercise(
                                oldExercise: exercise,
                                newExercise: newExercise,
                              );
                          return some(unit);
                        }),
                      )
                      .run();
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
