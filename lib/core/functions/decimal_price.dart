import 'package:intl/intl.dart';

String decimalNumer({required dynamic price}) {
  var formattedNumber =
      NumberFormat.currency(decimalDigits: 0, symbol: '').format(price);
  return formattedNumber;
}
