import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:jumpat/features/workout/domain/values/template_color.dart';

Future<Color?> changeTemplateColorDialog(
  BuildContext context,
  TemplateColor oldColor,
) async {
  return showDialog<Color>(
    context: context,
    builder: (context) =>
        ChangeTemplateColorDialog(initial: oldColor.getOrCrash()),
  );
}

class ChangeTemplateColorDialog extends HookWidget {
  const ChangeTemplateColorDialog({required this.initial, super.key});
  final Color initial;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final color = useState(initial);
    return AlertDialog(
      title: Text(t.changeTemplateColor),
      content: Flexible(
        child: MaterialColorPicker(
          onColorChange: (newColor) {
            color.value = newColor;
          },
          selectedColor: color.value,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(color.value);
          },
          child: Text(t.save),
        )
      ],
    );
  }
}
