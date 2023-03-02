import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/settings/presentation/widgets/default_repetition_count.dart';
import 'package:jumpat/features/settings/presentation/widgets/locale_select.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          runSpacing: 20,
          children: const [
            LocaleSelect(),
            DefaultRepetitionCount(),
          ],
        ),
      ),
    );
  }
}
