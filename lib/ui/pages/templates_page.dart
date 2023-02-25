import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jumpat/data/provider.dart';
import 'package:jumpat/ui/widgets/watching_list.dart';

class TemplatesPage extends ConsumerWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.templates),
      ),
      body: WatchingList(
        provider: watchTemplatesProvider,
        itemBuilder: (template) => ListTile(
          title: Text(template.name),
          leading: CircleColor(
            color: Color(template.color),
            circleSize: Theme.of(context).iconTheme.size ?? 24,
          ),
        ),
      ),
    );
  }
}
