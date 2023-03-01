import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WeightInput extends HookWidget {
  const WeightInput({
    required this.initial,
    required this.onWeightChanged,
    super.key,
  });
  final double initial;
  final Future<void> Function(double) onWeightChanged;

  void selectAll(TextEditingController controller) {
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.value.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController(text: initial.toString());

    useEffect(
      () {
        focusNode.addListener(() async {
          if (focusNode.hasPrimaryFocus) {
            selectAll(controller);
          } else {
            final d = double.tryParse(controller.text);
            if (d != null) {
              await onWeightChanged(d);
            }
          }
        });
        return;
      },
      [controller, focusNode],
    );

    final t = AppLocalizations.of(context)!;
    final autofocus = initial.compareTo(0) == 0;

    if (autofocus) {
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.value.text.length,
      );
    }

    return TextField(
      autofocus: autofocus,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: t.weightHint),
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+\.?\d?'),
        )
      ],
    );
  }
}
