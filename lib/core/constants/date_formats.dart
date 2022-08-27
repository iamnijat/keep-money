import 'package:intl/intl.dart';

abstract class DateFormats {
  const DateFormats._();

  static DateFormat monthNameDayYearDateFormat({String? locale = 'en'}) =>
      DateFormat('dd MMMM yyyy', locale);
}
