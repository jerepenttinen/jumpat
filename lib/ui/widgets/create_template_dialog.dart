import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/data/tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

Future<Template?> showCreateTemplateDialog(
  BuildContext context,
  Workout workout,
) async {
  return await showDialog(
    context: context,
    builder: (context) => CreateTemplateDialog(workout: workout),
  );
}

class CreateTemplateDialog extends HookConsumerWidget {
  const CreateTemplateDialog({required this.workout, super.key});
  final Workout workout;

  @override
  Widget build(BuildContext context, ref) {
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
                  final template = await ref.read(
                    createTemplateProvider(workout, name.value, color.value)
                        .future,
                  );
                  if (context.mounted) {
                    Navigator.of(context).pop(template);
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
