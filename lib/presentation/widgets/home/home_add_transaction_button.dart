part of widgets;

class HomeAddTransactionButton extends StatelessWidget {
  final AppLocalizations _localization;
  final HomePageCubit _cubit;
  const HomeAddTransactionButton(this._localization, this._cubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppPalette.mainBlueColor,
          ),
          child: Material(
            color: AppPalette.transparentColor,
            child: InkWell(
                onTap: () async =>
                    showAddTransactionModalBottomSheet(context, _localization)
                        .then((value) async {
                      if (value != null) {
                        await _cubit.fetchUser();
                      }
                    }),
                child: Center(
                  child: buildButtonText(
                      "+ ${_localization.homeBudgetOverviewAddTransaction}"),
                )),
          ),
        ),
      ],
    );
  }

  Text buildButtonText(String text) {
    return Text(
      text,
      style: AppStyles.whiteColor14spw500HindMadurai,
      textAlign: TextAlign.center,
    );
  }
}
