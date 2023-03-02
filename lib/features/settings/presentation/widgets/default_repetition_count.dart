import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/settings/domain/providers.dart';
import 'package:numberpicker/numberpicker.dart';

class DefaultRepetitionCount extends HookConsumerWidget {
  const DefaultRepetitionCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultRepCount = ref.watch(defaultRepetitionCountProvider);
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
          onChanged: (count) {
            ref.read(defaultRepetitionCountProvider.notifier).set(count);
          },
        ),
      ],
    );
  }
}
