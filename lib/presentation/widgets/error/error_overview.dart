part of widgets;

class ErrorOverview extends StatelessWidget {
  final AppLocalizations _localization;
  final VoidCallback refreshTap;
  const ErrorOverview(
    this._localization, {
    Key? key,
    required this.refreshTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _localization.errorPageTitle,
          style: AppStyles.blackHeadlineColor16spw700Montserrat,
          textAlign: TextAlign.center,
        ),
        const VerticalSpacer(2),
        Text(
          _localization.errorPageDesc,
          style: AppStyles.greyHeadlineColor12spw500MontserratLineHeight,
          textAlign: TextAlign.center,
        ),
        const VerticalSpacer(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: AppStyles.deviceTablet ? 10.h : 7.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppPalette.mainOrangeColor,
              ),
              child: Material(
                color: AppPalette.transparentColor,
                child: GestureDetector(
                    onTap: refreshTap,
                    child: Center(
                        child: Text(
                      _localization.errorPageRefreshButton,
                      style: AppStyles.whiteColor14spw700Montserrat,
                      textAlign: TextAlign.center,
                    ))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
