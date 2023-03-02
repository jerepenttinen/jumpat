import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/app_router.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';
import 'package:jumpat/features/workout/domain/providers/template.dart';

class TemplatesPage extends ConsumerWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final templatesAsync = ref.watch(templatesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.templates),
      ),
      body: templatesAsync.when(
        data: (templates) => ListView.builder(
          itemCount: templates.length,
          itemBuilder: (context, index) {
            final template = templates[index];
            return TemplatesListItem(template: template);
          },
        ),
        error: (error, stackTrace) => Center(child: Text('$error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class TemplatesListItem extends ConsumerWidget {
  const TemplatesListItem({required this.template, super.key});
  final TemplateEntity template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;

    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: t.edit,
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
            onPressed: (context) {
              context.router.push(EditTemplateRoute(templateId: template.id));
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(
          onDismissed: () async {
            await ref.read(templatesProvider.notifier).remove(template);
          },
        ),
        children: [
          SlidableAction(
            label: t.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            onPressed: (context) async {
              await ref.read(templatesProvider.notifier).remove(template);
            },
          )
        ],
      ),
      child: ListTile(
        title: Text(template.name.getOrCrash()),
        leading: CircleColor(
          color: template.color.getOrCrash(),
          circleSize: Theme.of(context).iconTheme.size ?? 24,
        ),
      ),
    );
  }
}
