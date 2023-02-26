import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:numberpicker/numberpicker.dart';

Future<int?> chooseRepCountDialog(BuildContext context, int last) async {
  return showDialog<int>(
    context: context,
    builder: (context) => ChooseRepCount(last: last),
  );
}

class ChooseRepCount extends StatefulWidget {
  const ChooseRepCount({required this.last, super.key});

  @override
  State<ChooseRepCount> createState() => _ChooseRepCountState();

  final int last;
}

class _ChooseRepCountState extends State<ChooseRepCount> {
  late int _currentRepCount = widget.last;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(t.repetitionCount),
      content: NumberPicker(
        value: _currentRepCount,
        minValue: 0,
        maxValue: 30,
        onChanged: (value) => setState(() {
          _currentRepCount = value;
        }),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_currentRepCount);
          },
          child: Text(t.save),
        )
      ],
    );
  }
}
