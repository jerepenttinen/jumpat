import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/data/settings_provider.dart';
import 'package:numberpicker/numberpicker.dart';

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
            DefaultRepCount(),
          ],
        ),
      ),
    );
  }
}

class LocaleSelect extends HookConsumerWidget {
  const LocaleSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final t = AppLocalizations.of(context)!;

    return DropdownButtonFormField<SupportedLocale>(
      decoration: InputDecoration(labelText: t.localeSetting),
      value: locale.languageCode == 'fi'
          ? SupportedLocale.finnish
          : SupportedLocale.system,
      items: [
        DropdownMenuItem<SupportedLocale>(
          value: SupportedLocale.system,
          child: Text(t.systemOption),
        ),
        DropdownMenuItem<SupportedLocale>(
          value: SupportedLocale.finnish,
          child: Text(t.finnish),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(localeProvider.notifier).setLocale(value);
        }
      },
    );
  }
}

class DefaultRepCount extends HookConsumerWidget {
  const DefaultRepCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultRepCount = ref.watch(defaultRepCountProvider);
    final t = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.defaultRepCount,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        NumberPicker(
          itemWidth: MediaQuery.of(context).size.width,
          minValue: 0,
          maxValue: 30,
          value: defaultRepCount,
          onChanged: (repCount) {
            ref
                .read(defaultRepCountProvider.notifier)
                .setDefaultRepCount(repCount);
          },
        ),
      ],
    );
  }
}
