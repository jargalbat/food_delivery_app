import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinInput extends StatelessWidget {
  const CustomPinInput({
    super.key,
    required this.controller,
    this.focusNode,
    this.onCompleted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onCompleted;
  final _focusedBorderColor = const Color.fromRGBO(23, 171, 144, 1);
  final _fillColor = const Color.fromRGBO(243, 246, 249, 0);
  final _borderColor = const Color.fromRGBO(23, 171, 144, 0.4);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: _borderColor),
      ),
    );

    return Pinput(
      // smsRetriever: smsRetriever,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
        if (onCompleted != null) onCompleted!();
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: _focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: _fillColor,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: _focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
