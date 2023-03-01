import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:numberpicker/numberpicker.dart';

Future<Option<int>> chooseRepCountDialog(BuildContext context, int last) async {
  return Option.fromNullable(
    await showDialog<int>(
      context: context,
      builder: (context) => ChooseRepCount(initial: last),
    ),
  );
}

class ChooseRepCount extends HookWidget {
  const ChooseRepCount({required this.initial, super.key});
  final int initial;

  @override
  Widget build(BuildContext context) {
    final repCount = useState(initial);
    final t = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(t.repetitionCount),
      content: NumberPicker(
        value: repCount.value,
        minValue: 0,
        maxValue: 30,
        onChanged: (value) => repCount.value = value,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(repCount.value);
          },
          child: Text(t.save),
        )
      ],
    );
  }
}
