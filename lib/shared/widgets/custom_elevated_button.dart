import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final double? width;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? double.infinity,
        child: ElevatedButton.icon(
          onPressed: isLoading ? null : onPressed,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  ),
                )
              : (icon != null ? Icon(icon, size: 24) : const SizedBox.shrink()),
          label: isLoading
              ? const SizedBox.shrink()
              : Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                ),
        ),
      ),
    );
  }
}
