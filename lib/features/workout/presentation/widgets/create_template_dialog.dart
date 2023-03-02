import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/entities/workout_entity.dart';
import 'package:jumpat/features/workout/domain/providers/workout.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';

TaskOption<TemplateEntity> showCreateTemplateDialog(
  BuildContext context,
  WorkoutEntity workout,
) {
  return TaskOption(
    () async {
      return Option.fromNullable(
        await showDialog<TemplateEntity>(
          context: context,
          builder: (context) => CreateTemplateDialog(workout: workout),
        ),
      );
    },
  );
}

class CreateTemplateDialog extends HookConsumerWidget {
  const CreateTemplateDialog({required this.workout, super.key});
  final WorkoutEntity workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final color = useState<Color>(Colors.red);
    final name = useState<String>('');
    final t = AppLocalizations.of(context)!;

    useEffect(
      () {
        controller.addListener(() {
          name.value = controller.text;
        });
        return;
      },
      [controller],
    );

    return AlertDialog(
      title: Text(t.templateDialogTitle),
      actions: [
        ElevatedButton(
          onPressed: name.value.isEmpty
              ? null
              : () async {
                  final template = await ref
                      .read(workoutStateProvider(id: workout.id).notifier)
                      .createTemplate(
                        name: TemplateName(name.value),
                        color: TemplateColor(color.value),
                      );

                  if (context.mounted) {
                    template.match(
                      () => null,
                      (template) => Navigator.of(context).pop(template),
                    );
                  }
                },
          child: Text(t.create),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(hintText: t.templateNameHint),
            textCapitalization: TextCapitalization.sentences,
          ),
          Flexible(
            child: MaterialColorPicker(
              onColorChange: (newColor) {
                color.value = newColor;
              },
              selectedColor: color.value,
            ),
          ),
        ],
      ),
    );
  }
}
