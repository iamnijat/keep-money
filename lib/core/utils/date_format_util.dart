import '../constants/date_formats.dart';

abstract class DateFormatUtil {
  const DateFormatUtil._();

  static String monnthNameDayYearFormattedDate(DateTime date) {
    return DateFormats.monthNameDayYearDateFormat().format(date);
  }

  static DateTime get currentTime => DateTime.now();
}
