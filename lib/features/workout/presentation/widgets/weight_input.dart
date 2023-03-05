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
    final weightState = useState(initial);
    final weight = useValueListenable(weightState);

    useEffect(
      () {
        focusNode.addListener(() async {
          if (focusNode.hasPrimaryFocus) {
            selectAll(controller);
          } else {
            final d = double.tryParse(controller.text);
            if (d != null) {
              weightState.value = d;
            }
          }
        });
        return;
      },
      [controller, focusNode],
    );

    useEffect(
      () {
        onWeightChanged(weight);
        return;
      },
      [weight],
    );

    final t = AppLocalizations.of(context)!;
    final autofocus = initial.compareTo(0) == 0;

    if (autofocus) {
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.value.text.length,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: weightState.value > 0
              ? () {
                  final tens = weightState.value * 10;
                  if (tens % 25 == 0) {
                    weightState.value -= 2.5;
                  } else {
                    weightState.value -= (tens % 25) / 10;
                  }
                  controller.text = weightState.value.toString();
                }
              : null,
          icon: const Icon(Icons.remove),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              autofocus: autofocus,
              focusNode: focusNode,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: t.weightHint),
              controller: controller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d?'),
                )
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            final tens = weightState.value * 10;
            if (tens % 25 == 0) {
              weightState.value += 2.5;
            } else {
              weightState.value += 2.5 - (tens % 25) / 10;
            }
            controller.text = weightState.value.toString();
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
