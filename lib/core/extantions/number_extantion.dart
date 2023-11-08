import 'package:intl/intl.dart';

extension FormatPayment on int {
  String format() {
    return NumberFormat.currency(locale: 'uz').format(this);
  }
}
