import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.textInputType = TextInputType.name,
    this.isEmailField = false,
    this.isPhoneNoField = false,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final String labelText;
  final IconData icon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool isEmailField;
  final bool isPhoneNoField;
  final FocusNode focusNode;
  final void Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: isPhoneNoField
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      controller: controller,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This field is required";
        }
        if (isEmailField) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
          if (!emailRegex.hasMatch(value.trim())) {
            return "Enter a valid Email Address";
          }
        }
        if (isPhoneNoField) {
          final phoneRegExp = RegExp(r'^[6-9]\d{9}$');
          if (!phoneRegExp.hasMatch(value.trim())) {
            return 'Enter a valid 10-digit phone number';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
