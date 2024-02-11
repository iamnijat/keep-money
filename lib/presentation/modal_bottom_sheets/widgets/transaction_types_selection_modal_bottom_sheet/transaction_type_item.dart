part of modal_bottom_sheets;

class TransactionTypeItem extends StatefulWidget {
  final TransactionTypesSelectionCubit _cubit;
  final int _index;
  const TransactionTypeItem(this._cubit, this._index, {Key? key})
      : super(key: key);

  @override
  State<TransactionTypeItem> createState() => _TransactionTypeItemState();
}

class _TransactionTypeItemState extends State<TransactionTypeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => widget._cubit
          .selectType(widget._cubit.types![widget._index], context, mounted),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 4.5.h,
                width: 4.5.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_image), fit: BoxFit.cover),
                ),
              ),
              const HorizontalSpacer(5),
              Text(_title,
                  style: AppStyles.blackHeadlineColor14spw700Montserrat),
            ],
          ),
          StreamBuilder<TransactionTypeViewModel>(
              stream: widget._cubit.typesSelectionStream,
              builder: (context, snapshot) {
                final typeValue = snapshot.data?.type;
                return AnimatedOpacity(
                  opacity: typeValue == _type ? 1 : 0,
                  duration: DurationsUtil.threeHundredMillisecondsDuration,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                    decoration: BoxDecoration(
                        color: AppPalette.mainBlueColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: SvgPicture.asset(
                      AppAssets.whiteDoneIcon,
                      colorFilter: const ColorFilter.mode(
                        AppPalette.whiteColor,
                        BlendMode.srcIn,
                      ),
                      height: 1.5.w,
                      width: 1.5.w,
                    )),
                  ),
                );
              })
        ],
      ),
    );
  }

  String get _title => widget._cubit.transactionTitle(widget._index);

  String get _type => widget._cubit.transactionType(widget._index);

  String get _image => AppAssets.transactionImage(_type);
}
