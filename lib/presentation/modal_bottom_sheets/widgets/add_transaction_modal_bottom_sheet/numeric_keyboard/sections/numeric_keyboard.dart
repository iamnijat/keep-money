part of modal_bottom_sheets;

class NumericKeyboard extends StatelessWidget {
  final AddTransactionCubit _cubit;
  const NumericKeyboard(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NumericThreeNumbersRow(const ['1', '2', '3'], _cubit),
        NumericThreeNumbersRow(const ['4', '5', '6'], _cubit),
        NumericThreeNumbersRow(const ['7', '8', '9'], _cubit),
        NumericZeroDotRow(_cubit)
      ],
    );
  }
}
