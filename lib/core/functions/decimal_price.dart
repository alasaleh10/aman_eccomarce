import 'package:intl/intl.dart';

String decimalNumer({required dynamic price}) {
  var formattedNumber =
      NumberFormat.currency(locale: 'en', decimalDigits: 0, symbol: '')
          .format(price);
  return formattedNumber;
}
