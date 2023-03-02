import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jumpat/features/workout/domain/values/template_name.dart';

Future<String?> changeTemplateNameDialog(
  BuildContext context,
  TemplateName oldName,
) async {
  return showDialog(
    context: context,
    builder: (context) =>
        ChangeTemplateNameDialog(initial: oldName.getOrCrash()),
  );
}

class ChangeTemplateNameDialog extends HookWidget {
  const ChangeTemplateNameDialog({required this.initial, super.key});
  final String initial;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initial);
    final t = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(t.changeTemplateName),
      content: TextField(
        controller: controller,
        onSubmitted: (value) => Navigator.of(context).pop(controller.text),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: Text(t.save),
        )
      ],
    );
  }
}
