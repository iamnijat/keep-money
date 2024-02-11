part of modal_bottom_sheets;

class KeyboardSubmitButton extends StatefulWidget {
  final AddTransactionCubit _cubit;
  final AddTransactionState _state;

  const KeyboardSubmitButton(this._cubit, this._state, {Key? key})
      : super(key: key);

  @override
  State<KeyboardSubmitButton> createState() => _KeyboardSubmitButtonState();
}

class _KeyboardSubmitButtonState extends State<KeyboardSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget._cubit.validateForm,
        builder: (context, snapshot) {
          final isFormValid = snapshot.hasData;
          final isLastOfAmountContainsDot =
              widget._cubit.isLastOfAmountContainsDot;
          final isAmountEmpty = widget._cubit.isAmountEmpty;
          return GestureDetector(
            onTap: () async {
              if (_isFormValid(
                  isFormValid, isLastOfAmountContainsDot, isAmountEmpty)) {
                await widget._cubit.addTransaction(context, mounted);
              }
            },
            child: AnimatedContainer(
              height: 24.h,
              width: 34.w,
              duration: DurationsUtil.threeHundredMillisecondsDuration,
              decoration: BoxDecoration(
                color:
                    isFormValid && !isLastOfAmountContainsDot && !isAmountEmpty
                        ? AppPalette.mainBlueColor
                        : AppPalette.fourthGrayColor,
              ),
              child: _isLoading
                  ? buildIndicator()
                  : buildDoneIcon(_isFormValid(
                      isFormValid, isLastOfAmountContainsDot, isAmountEmpty)),
            ),
          );
        });
  }

  bool get _isLoading => widget._state == AddTransactionState.loading;

  bool _isFormValid(bool isFormValid, bool isLastOfAmountContainsDot,
          bool isAmountEmpty) =>
      isFormValid && !isLastOfAmountContainsDot && !isAmountEmpty;

  Icon buildDoneIcon(bool isFormValid) => Icon(Icons.done_all_rounded,
      size: 4.h,
      color: isFormValid ? AppPalette.whiteColor : AppPalette.mainBlueColor);

  Center buildIndicator() {
    return Center(
      child: SizedBox(
        height: 4.5.h,
        width: 4.5.h,
        child: const CircularProgressIndicator(
          strokeWidth: 2.7,
          valueColor: AlwaysStoppedAnimation(AppPalette.whiteColor),
        ),
      ),
    );
  }
}
