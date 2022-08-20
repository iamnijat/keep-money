part of widgets;

class HomeBudgetDetailsBox extends StatefulWidget {
  final AppLocalizations _localization;
  final HomePageCubit _cubit;
  final HomePageState _state;
  const HomeBudgetDetailsBox(this._localization, this._cubit, this._state,
      {Key? key})
      : super(key: key);

  @override
  State<HomeBudgetDetailsBox> createState() => _HomeBudgetDetailsBoxState();
}

class _HomeBudgetDetailsBoxState extends State<HomeBudgetDetailsBox> {
  late final ScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        width: 100.w,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: const BoxDecoration(
          color: AppPalette.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: _isLoading
            ? const ShimmerLoadingIndicator()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _isEmpty
                    ? const HomeNoTransactionWidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const VerticalSpacer(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget._localization.homePageTodayTitle,
                                  style: AppStyles
                                      .blackHeadlineColor16spw700Montserrat),
                              const HorizontalSpacer(4),
                              Flexible(
                                child: Text(_todayExpense,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles
                                        .mainBlueColor16spw700Montserrat),
                              )
                            ],
                          ),
                          const VerticalSpacer(4),
                          MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: FadingEdgeScrollView.fromScrollView(
                                child: ListView.builder(
                                    reverse: true,
                                    controller: _controller,
                                    itemCount:
                                        widget._cubit.transactions.length,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final data =
                                          widget._cubit.transactions[index];
                                      return HomeTransactionItem(
                                          widget._cubit, data, index);
                                    }),
                              )),
                        ],
                      )),
      ),
    );
  }

  bool get _isLoading => widget._state == HomePageState.loading;

  bool get _isEmpty => widget._state == HomePageState.empty;

  String get _todayExpense => widget._cubit.todayExpense.toString();
}
