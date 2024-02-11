part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetSubmitButton extends StatefulWidget {
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  final PersonalInfoEditModalBottomSheetState _state;

  const PersonalInfoEditModalBottomSheetSubmitButton(this._cubit, this._state,
      {Key? key})
      : super(key: key);

  @override
  State<PersonalInfoEditModalBottomSheetSubmitButton> createState() =>
      _PersonalInfoEditModalBottomSheetSubmitButtonState();
}

class _PersonalInfoEditModalBottomSheetSubmitButtonState
    extends State<PersonalInfoEditModalBottomSheetSubmitButton> {
  bool get _isLoading =>
      widget._state == PersonalInfoModalBottomSheetState.loading;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget._cubit.isFormValid,
        builder: (context, formSnapshot) {
          final isFormValid = formSnapshot.data;
          final isNameEmpty = widget._cubit.isNameEmpty;
          final isIncomeEmpty = widget._cubit.isIncomeEmpty;

          return IgnorePointer(
              ignoring: _isLoading ||
                  _isFormValid(isFormValid, isNameEmpty, isIncomeEmpty) ==
                      false,
              child: AnimatedOpacity(
                opacity:
                    _isFormValid(isFormValid, isNameEmpty, isIncomeEmpty) ==
                            true
                        ? 1
                        : 0,
                duration: DurationsUtil.fourHundredMillisecondsDuration,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => widget._cubit.update(context, mounted),
                    child: Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: const BoxDecoration(
                          color: AppPalette.mainOrangeColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: _isLoading ? buildIndicator() : buildIcon(),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }

  bool _isFormValid(bool? isFormValid, bool isNameEmpty, bool isIncomeEmpty) =>
      isFormValid == true && !isNameEmpty && !isIncomeEmpty;

  Icon buildIcon() {
    return Icon(Icons.arrow_forward_ios_rounded,
        color: AppPalette.whiteColor, size: 2.8.h);
  }

  SizedBox buildIndicator() {
    return SizedBox(
      height: 2.h,
      width: 2.h,
      child: const CircularProgressIndicator(
        strokeWidth: 2.3,
        valueColor: AlwaysStoppedAnimation(AppPalette.whiteColor),
      ),
    );
  }
}
