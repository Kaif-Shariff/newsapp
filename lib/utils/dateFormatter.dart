import 'package:intl/intl.dart';

String dateFormatter(String isoDate) {
  try {
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat("MMMM d, y").format(dateTime);
  } catch (e) {
    return "Unknown";
  }
}
