part of widgets;

class PersonalInfoOverview extends StatelessWidget {
  final AppLocalizations _localization;
  const PersonalInfoOverview(this._localization, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _localization.personalInfoTitle,
            textAlign: TextAlign.center,
            style: AppStyles.blackHeadlineColor20spw700MontserratLineHeight,
          ),
          const VerticalSpacer(2),
          Text(
            _localization.personalInfoDesc,
            textAlign: TextAlign.center,
            style: AppStyles.greyHeadlineColor12spw500MontserratLineHeight,
          ),
        ],
      ),
    );
  }
}
