part of modal_bottom_sheets;

class PersonalInfoModalBottomSheetForm extends StatefulWidget {
  final AppLocalizations _localization;
  final PersonalInfoModalBottomSheetCubit _cubit;
  final PersonalInfoModalBottomSheetState _state;

  const PersonalInfoModalBottomSheetForm(
      this._localization, this._cubit, this._state,
      {Key? key})
      : super(key: key);

  @override
  State<PersonalInfoModalBottomSheetForm> createState() =>
      _PersonalInfoModalBottomSheetFormState();
}

class _PersonalInfoModalBottomSheetFormState
    extends State<PersonalInfoModalBottomSheetForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: PersonalInfoModalBottomSheetAvatarField(widget._cubit),
            ),
            const VerticalSpacer(5),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget._localization.personalInfoFormNameTitle,
                  style: AppStyles.secondaryGreyColor10spw600Montserrat),
            ),
            PersonalInfoModalBottomSheetNameField(
                widget._cubit, widget._localization),
            const PersonalInfoModalBottomSheetDivider(),
            const VerticalSpacer(2),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget._localization.personalInfoFormIncomeTitle,
                  style: AppStyles.secondaryGreyColor10spw600Montserrat),
            ),
            PersonalInfoModalBottomSheetIncomeField(
                widget._cubit, widget._localization),
            const PersonalInfoModalBottomSheetDivider(),
            const VerticalSpacer(2),
            PersonalInfoModalBottomSheetGenderField(widget._cubit),
            const VerticalSpacer(6),
            PersonalInfoModalBottomSheetSubmitButton(
                widget._cubit, widget._state),
            const VerticalSpacer(4),
          ],
        ));
  }
}
