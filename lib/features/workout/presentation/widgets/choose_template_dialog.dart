import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';

Future<TemplateEntity?> chooseTemplateDialog(BuildContext context) async {
  return showDialog<TemplateEntity>(
    context: context,
    builder: (context) => const ChooseTemplateDialog(),
  );
}

class ChooseTemplateDialog extends ConsumerWidget {
  const ChooseTemplateDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(templatesProvider);
    final t = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(t.chooseTemplateDialogTitle),
      content: templatesAsync.when(
        data: (templates) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: templates
                .map(
                  (template) => ListTile(
                    title: Text(template.name.getOrCrash()),
                    leading: CircleColor(
                      color: template.color.getOrCrash(),
                      circleSize: Theme.of(context).iconTheme.size ?? 24,
                    ),
                    onTap: () => Navigator.of(context).pop(template),
                  ),
                )
                .toList(),
          ),
        ),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
