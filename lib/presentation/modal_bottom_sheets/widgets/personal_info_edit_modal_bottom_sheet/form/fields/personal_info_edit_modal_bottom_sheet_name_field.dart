part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetNameField extends StatelessWidget {
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  final AppLocalizations _localization;
  final String? _name;
  const PersonalInfoEditModalBottomSheetNameField(
      this._cubit, this._localization, this._name,
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
        initialValue: _name,
        showCursor: true,
        autocorrect: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        inputFormatters: [LengthLimitingTextInputFormatter(40)],
        onChanged: (text) => _cubit.updateName(text.trim()),
        decoration: InputDecoration(
          hintStyle: AppStyles.secondaryGreyColor14spw500Montserrat,
          contentPadding: EdgeInsets.symmetric(vertical: 2.h),
          hintText: _localization.personalInfoFormNameHintText,
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
