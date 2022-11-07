class ConverterUtils {
  //==================== Round Number ====================
  static String numRounderToString(num number) {
    final roundedNumber = num.parse(number.toStringAsFixed(2));
    return roundedNumber.toString();
  }

  //==================== Round Number ====================
  static num numRounder(num number) {
    final roundedNumber = num.parse(number.toStringAsFixed(2));
    return roundedNumber;
  }
}
