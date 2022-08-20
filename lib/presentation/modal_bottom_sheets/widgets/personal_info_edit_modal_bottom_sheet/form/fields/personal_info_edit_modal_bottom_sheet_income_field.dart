part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetIncomeField extends StatelessWidget {
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  final AppLocalizations _localization;
  final String? _income;
  const PersonalInfoEditModalBottomSheetIncomeField(
      this._cubit, this._localization, this._income,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        cursorHeight: 3.h,
        cursorColor: AppPalette.mainOrangeColor,
        autofocus: true,
        showCursor: true,
        autocorrect: false,
        keyboardType: TextInputType.number,
        initialValue: _income,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(40),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (text) => _cubit.updateIncome(text.trim()),
        decoration: InputDecoration(
          hintStyle: AppStyles.secondaryGreyColor14spw500Montserrat,
          contentPadding: EdgeInsets.symmetric(vertical: 2.h),
          hintText: _localization.personalInfoFormIncomeHintText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          fillColor: AppPalette.whiteColor,
        ),
      ),
    );
  }
}
