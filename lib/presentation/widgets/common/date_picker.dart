part of widgets;

class DatePicker extends StatelessWidget {
  final void Function(DateTime) _onTap;
  const DatePicker(this._onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: CupertinoDatePicker(
        minimumYear: 2015,
        maximumYear: currentTime.year,
        initialDateTime: currentTime,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (date) => _onTap(date),
      ),
    );
  }

  static DateTime get currentTime => DateFormatUtil.currentTime;
}
