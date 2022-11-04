import 'package:intl/intl.dart';

class DateFormater {
  static String getExactDateTime() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  static String getJustDate() {
    return DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  static int getDayAsInt() {
    return getDayNumer(DateFormat("EEEEE").format(DateTime.now()));
  }

  static int getDayNumer(String day) {
    Map<String, int> weekDay = {
      "Monday": 1,
      "Tuesday": 2,
      "Wednesday": 3,
      "Thursday": 4,
      "Friday": 5,
      "Saturday": 6,
      "Sunday": 7,
    };

    return weekDay[day]!;
  }
}
