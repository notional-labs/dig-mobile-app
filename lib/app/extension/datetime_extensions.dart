import 'package:intl/intl.dart';

extension DateTimeExentions on DateTime {
  String toYYYYMMdd() {
    final dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(this);
  }
}
