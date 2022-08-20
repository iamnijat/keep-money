part of widgets;

class HomeBudgetOverviewbox extends StatelessWidget {
  final AppLocalizations _localization;
  final HomePageCubit _cubit;
  final HomePageState _state;
  const HomeBudgetOverviewbox(this._localization, this._cubit, this._state,
      {Key? key})
      : super(key: key);

  bool get _isLoading => _state == HomePageState.loading;

  bool get _isEmpty => _state == HomePageState.empty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      decoration: const BoxDecoration(color: AppPalette.mainOrangeColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(_localization.homeBudgetOverviewHello(_name),
                  style: AppStyles.whiteColor18spw700Montserrat),
            ),
            InkWell(
              onTap: () {
                showProfilePreferencesModalBottomSheet(context, _localization,
                        user: _cubit.user)
                    .then((value) => _cubit.fetchUser());
              },
              child: AnimatedOpacity(
                opacity: _isLoading ? 0 : 1,
                duration: Durations.fourHundredMillisecondsDuration,
                child: Container(
                  width: 5.h,
                  height: 5.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: svg_provider.Svg(_image), fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
        const VerticalSpacer(5),
        SizedBox(
          width: 75.w,
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '₼ $_expense\n\n',
                  style: AppStyles.whiteColor24spw700Montserrat),
              TextSpan(
                  text: _localization.homeBudgetOverviewBudgetDesc(_income),
                  style: AppStyles.thirdGreyColor12spw500Montserrat),
            ]),
          ),
        ),
        const VerticalSpacer(4),
        HomeAddTransactionButton(_localization, _cubit),
      ]),
    );
  }

  String get _image => AppAssets.avatarImage(
      _isLoading ? 'male' : _user!.gender.toString().toLowerCase());

  String get _name => _isLoading ? '' : _user!.name.toString();

  String get _income {
    if (_isLoading) {
      return '';
    } else {
      return _user!.income!.parseAndRound;
    }
  }

  String get _expense {
    if (_isLoading) {
      return '';
    } else {
      return _isEmpty ? "0" : _cubit.expense.toString().parseAndRound;
    }
  }

  UserViewModel? get _user => _cubit.user;
}
