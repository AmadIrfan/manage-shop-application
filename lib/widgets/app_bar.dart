import 'package:flutter/material.dart';

class TopAppBar {
  static PreferredSizeWidget appBar(String title, {List<Widget>? actions}) {
    return AppBar(
      elevation: 5,
      title: Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
