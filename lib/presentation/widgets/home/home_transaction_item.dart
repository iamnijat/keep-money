part of widgets;

class HomeTransactionItem extends StatelessWidget {
  final HomePageCubit _cubit;
  final TransactionViewModel _transaction;
  final int _index;
  const HomeTransactionItem(this._cubit, this._transaction, this._index,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTransactionItemDismissibleWidget(
          onDismissTap: () async {
            await _cubit.removeTransaction(_transaction.id);
          },
          child: Container(
              constraints: BoxConstraints(minHeight: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 4.5.h,
                        width: 4.5.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(_image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const HorizontalSpacer(4),
                      Text(_title,
                          style:
                              AppStyles.blackHeadlineColor14spw700Montserrat),
                    ],
                  ),
                  const HorizontalSpacer(4),
                  Flexible(
                      child: Text(_amount,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.mainBlueColor16spw700Montserrat)),
                ],
              )),
        ),
        if (_index >= 0) const VerticalSpacer(2)
      ],
    );
  }

  String get _title => _transaction.title.toString();

  String get _type => _transaction.type.toString();

  String get _amount => _transaction.amount!.parseAndRound;

  String get _image => AppAssets.transactionImage(_type);
}
