import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.nexFocus,
    required this.widgetFocus,
    required this.textInputAction,
    required this.textInputType,
    this.inputBorder = InputBorder.none,
  });

  final TextEditingController controller;
  final FocusNode widgetFocus;
  final FocusNode nexFocus;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String label;
  final InputBorder inputBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.black12,
      child: TextFormField(
        controller: controller,
        focusNode: widgetFocus,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: Text(label),
          border: inputBorder,
        ),
      ),
    );
  }
}
