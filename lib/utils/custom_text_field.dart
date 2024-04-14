import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.label,
    this.nextFocus,
    this.onSubmit,
    this.onSave,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enabled = true,
    this.suffix,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
  });
  final bool enabled;
  final String? label;
  final int? maxLines;
  final bool? readOnly;
  final Widget? suffix;
  final FocusNode? nextFocus;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final void Function(String?)? onSave;
  final void Function(String?)? onSubmit;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.black12,
      child: TextFormField(
        enabled: enabled,
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffix: suffix,
          label: label == null ? const SizedBox() : Text(label!),
          fillColor: Colors.blueAccent,
          border: InputBorder.none,
        ),
        validator: validator,
        onFieldSubmitted: onSubmit,
        onSaved: onSave,
        onChanged: onChanged,
      ),
    );
  }
}
