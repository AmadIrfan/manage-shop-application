import 'package:flutter/material.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({super.key, required this.child, required this.onPressed});
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: child,
    );
  }
}
