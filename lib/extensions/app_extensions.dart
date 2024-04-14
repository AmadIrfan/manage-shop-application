extension NumberParse on String {
  int intParser() {
    return int.parse(this);
  }
}

extension MStr on int {
  String stringify() {
    return this.toString();
  }
}
