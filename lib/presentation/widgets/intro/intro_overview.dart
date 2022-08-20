part of widgets;

class IntroOverview extends StatelessWidget {
  final AppLocalizations _localization;
  const IntroOverview(this._localization, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: '${_localization.introPageTitlePart1}\n',
                style: AppStyles.blackHeadlineColor20spw700MontserratLineHeight,
              ),
              TextSpan(
                text: _localization.introPageTitlePart2,
                style: AppStyles.mainOrangeColor20spw700Montserrat,
              ),
              TextSpan(
                text: '.',
                style: AppStyles.blackHeadlineColor20spw700MontserratLineHeight,
              ),
            ]),
          ),
        ),
        const VerticalSpacer(2),
        Text(
          _localization.introPageDesc,
          style: AppStyles.greyHeadlineColor12spw500MontserratLineHeight,
        ),
      ],
    );
  }
}
