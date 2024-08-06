import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final String? hintText;
  final IconData? icon;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null,
        counterText: '',
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
    );
  }
}
