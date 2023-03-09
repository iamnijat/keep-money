part of widgets;

class IntroButton extends StatelessWidget {
  final IntroPageCubit _cubit;
  final AppLocalizations _localization;
  const IntroButton(
    this._cubit,
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        key: const Key("introNextButton"),
        onPressed: () {
          _cubit.checkRoute(context);
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
