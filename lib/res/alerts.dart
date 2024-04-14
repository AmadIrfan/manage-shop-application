import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alerts {
  Alerts();
  void showSnackBar(String text, {Color backgroundColor = Colors.black}) {
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: backgroundColor,
    );
  }

  void loadingAlert(BuildContext context, String txt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      txt,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        // color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
