part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetForm extends StatefulWidget {
  final AppLocalizations _localization;
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  final PersonalInfoEditModalBottomSheetState _state;
  final UserViewModel? user;
  const PersonalInfoEditModalBottomSheetForm(
      this._localization, this._cubit, this._state,
      {Key? key, required this.user})
      : super(key: key);

  @override
  State<PersonalInfoEditModalBottomSheetForm> createState() =>
      _PersonalInfoEditModalBottomSheetFormState();
}

class _PersonalInfoEditModalBottomSheetFormState
    extends State<PersonalInfoEditModalBottomSheetForm> {
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
              child: PersonalInfoEditModalBottomSheetAvatarField(widget._cubit),
            ),
            const VerticalSpacer(5),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget._localization.personalInfoFormNameTitle,
                  style: AppStyles.secondaryGreyColor10spw600Montserrat),
            ),
            PersonalInfoEditModalBottomSheetNameField(
                widget._cubit, widget._localization, widget.user?.name),
            const PersonalInfoModalBottomSheetDivider(),
            const VerticalSpacer(2),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget._localization.personalInfoFormIncomeTitle,
                  style: AppStyles.secondaryGreyColor10spw600Montserrat),
            ),
            PersonalInfoEditModalBottomSheetIncomeField(
                widget._cubit, widget._localization, widget.user?.income),
            const PersonalInfoModalBottomSheetDivider(),
            const VerticalSpacer(2),
            PersonalInfoEditModalBottomSheetGenderField(widget._cubit),
            const VerticalSpacer(6),
            PersonalInfoEditModalBottomSheetSubmitButton(
                widget._cubit, widget._state),
            const VerticalSpacer(4),
          ],
        ));
  }
}
