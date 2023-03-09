part of widgets;

class PersonalInfoButton extends StatelessWidget {
  final AppLocalizations _localization;

  const PersonalInfoButton(
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showPersonalInfoModalBottomSheet(context, _localization);
        },
        style: TextButton.styleFrom(
            foregroundColor: AppPalette.greyHeadlineColor,
            shadowColor: AppPalette.greyHeadlineColor,
            backgroundColor: AppPalette.whiteColor),
        child: buildButtonText(_localization.introPageButtonText));
  }

  Text buildButtonText(String text) {
    return Text(
      text,
      style: AppStyles.mainOrangeColor14spw700Montserrat,
      textAlign: TextAlign.center,
    );
  }
}
