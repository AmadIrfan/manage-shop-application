import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PressButton extends StatelessWidget {
  const PressButton({
    super.key,
    this.isLoading = false,
    required this.title,
    required this.onTap,
    this.bgColor = Colors.amber,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    this.focusNode,
  });

  final String title;
  final bool isLoading;
  final FocusNode? focusNode;
  final Color bgColor;
  final Function onTap;
  final TextStyle textStyle;
  @override
  build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: isLoading ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusNode: focusNode,
        onTap: () {
          isLoading ? null : onTap();
        },
        child: Container(
          height: isLoading ? 60 : 50,
          alignment: Alignment.center,
          width: isLoading ? null : double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            shape: isLoading ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isLoading
                ? null
                : BorderRadius.circular(
                    15,
                  ),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: isLoading
              ? const SpinKitCircle(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
