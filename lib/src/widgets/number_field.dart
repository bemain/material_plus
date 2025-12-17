import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField<T extends num> extends StatelessWidget {
  /// The initial value.
  final T? value;

  final T? min;
  final T? max;

  /// If `true`, automatically prefixes the value with the correct sign.
  ///
  /// When the user starts editing the value, the prefix is removed so that the sign can be edited.
  final bool prefixWithSign;

  final TextStyle? style;

  final List<TextInputFormatter>? inputFormatters;

  final void Function(T value)? onSubmitted;

  late final TextEditingController controller = TextEditingController(
    text: prefixWithSign ? value?.abs().toString() : value?.toString(),
  );

  /// Optional text prefix to place on the line before the input.
  late final ValueNotifier<String?> prefixText = ValueNotifier(
    !prefixWithSign || value == null
        ? null
        : value! >= 0
        ? "+"
        : "-",
  );

  /// A [TextField] for inputting numbers only.
  NumberField({
    super.key,
    this.value,
    this.min,
    this.max,
    required this.onSubmitted,
    this.prefixWithSign = false,
    this.style,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: prefixText,
      builder: (context, child) => TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixText: prefixText.value,
          border: const UnderlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
        ),
        style: style,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        textInputAction: TextInputAction.done,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r"^(-|-?\d+(?:\.\d*)?)$"),
          ), // Allow positive and negative decimal numbers, as well as just a minus sign
          ...?inputFormatters,
        ],
        maxLines: 1,
        enabled: onSubmitted != null,
        onChanged: (value) {
          /// Remove prefix and instead add the minus sign to the text, so that it can be edited.
          if (prefixText.value == "-" && !value.startsWith("-")) {
            controller.text = "-${controller.text}";
          }
          prefixText.value = null;
        },
        onSubmitted: (value) {
          num? parsed = num.tryParse(value);
          if (parsed == null) {
            // Reset to the actual value
            if (this.value != null) controller.text = this.value.toString();
            return;
          }

          T clamped =
              parsed.clamp(
                    min ?? double.negativeInfinity,
                    max ?? double.infinity,
                  )
                  as T;
          controller.text = clamped.toString();
          onSubmitted?.call(clamped);
        },
      ),
    );
  }
}
