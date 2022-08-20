import '../constants/date_formats.dart';

abstract class DateFormatUtil {
  const DateFormatUtil._();

  static String europeFormattedDate(DateTime date) {
    return DateFormats.europeDateFormat().format(date);
  }

  static String monnthNameDayYearFormattedDate(DateTime date) {
    return DateFormats.monthNameDayYearDateFormat().format(date);
  }

  static DateTime get currentTime => DateTime.now();
}
