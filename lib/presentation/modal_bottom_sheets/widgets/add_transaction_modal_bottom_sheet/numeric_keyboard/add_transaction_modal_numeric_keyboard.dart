part of modal_bottom_sheets;

class AddTransactionModalNumericKeyboard extends StatelessWidget {
  final AddTransactionCubit _cubit;
  final AddTransactionState _state;
  const AddTransactionModalNumericKeyboard(this._cubit, this._state, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyboardRecentValues(_cubit),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumericKeyboard(_cubit),
            KeyboardInteractionButtons(_cubit, _state)
          ],
        ),
      ],
    );
  }
}
