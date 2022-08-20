part of modal_bottom_sheets;

class KeyboardInteractionButtons extends StatelessWidget {
  final AddTransactionCubit _cubit;
  final AddTransactionState _state;
  const KeyboardInteractionButtons(this._cubit, this._state, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        KeyboardBackspaceButton(
            () => _cubit.deleteDigitOneByOneFromTypedValue()),
        KeyboardSubmitButton(_cubit, _state)
      ],
    );
  }
}
