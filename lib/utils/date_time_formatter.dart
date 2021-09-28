import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formateFullDate12hr(DateTime time) {
    final _eventTimeFormatter = DateFormat.yMMMMd('en_US').add_jm();

    return _eventTimeFormatter.format(time);
  }
}
