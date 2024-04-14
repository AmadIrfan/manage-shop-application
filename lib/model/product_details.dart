import 'package:flutter/foundation.dart';

class ProductDetails with ChangeNotifier {
  ProductDetails._instance() {
    if (kDebugMode) {
      print('this is instance');
    }
  }
  static final ProductDetails instance = ProductDetails._instance();
}
