import 'package:easy_localization/easy_localization.dart';

class NumberFormatter {
  //currency format
  static final _amountFormat = NumberFormat("#,##0 000  ", "en_US");
  static String currency(num? number, [String symbol = ' ']) {
    if (number == null) return '';
    if (number < 1000) return number.toInt().toString();

    return _amountFormat.format(number.toInt()).replaceAll(',', symbol);
  }
}