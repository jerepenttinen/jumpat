import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';

class WeightInput extends StatefulWidget {
  const WeightInput({
    required this.initial,
    required this.onWeightChanged,
    super.key,
  });

  final double initial;
  final Future Function(double) onWeightChanged;

  @override
  State<WeightInput> createState() => _WeightInputState();
}

class _WeightInputState extends State<WeightInput> {
  late final controller =
      TextEditingController(text: widget.initial.toString());

  final input = BehaviorSubject<String>();

  @override
  Widget build(BuildContext context) {
    final autofocus = widget.initial.compareTo(0) == 0;
    controller.addListener(
      () {
        input.add(controller.text);
      },
    );

    if (autofocus) {
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.value.text.length,
      );
    }

    input.debounceTime(const Duration(milliseconds: 500)).switchMap(
      (value) async* {
        final d = double.tryParse(value);
        if (d != null) {
          yield d;
        }
      },
    ).listen(
      (event) async {
        await widget.onWeightChanged(event);
      },
    );

    return TextField(
      autofocus: autofocus,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(labelText: 'Paino'),
      controller: controller,
      onTap: () => controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.value.text.length,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+\.?\d?'),
        )
      ],
    );
  }
}
