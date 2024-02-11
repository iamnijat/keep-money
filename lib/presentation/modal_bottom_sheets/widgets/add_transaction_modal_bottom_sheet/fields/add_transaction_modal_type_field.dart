part of modal_bottom_sheets;

class AddTransactionModalTypeField extends StatelessWidget {
  final AddTransactionCubit _cubit;
  final AppLocalizations _localization;
  const AddTransactionModalTypeField(this._cubit, this._localization,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _showTypeModalSheet(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder<TransactionTypeViewModel>(
              stream: _cubit.typeStream,
              builder: (context, snapshot) {
                final typeValue = snapshot.data;
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 4.5.h,
                        width: 4.5.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(_image(typeValue!.type.toString())),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const HorizontalSpacer(4),
                      buildTitle(typeValue.title.toString())
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildTitle(_localization.addTransactionSelectTypeTitle)
                    ],
                  );
                }
              }),
          buildIcon(),
        ],
      ),
    );
  }

  AnimatedSwitcher buildTitle(String text) {
    return AnimatedSwitcher(
      duration: DurationsUtil.twoHundredFiftyMillisecondsDuration,
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: Text(
        text,
        style: AppStyles.blackHeadlineColor14spw700Montserrat,
        key: UniqueKey(),
      ),
    );
  }

  void _showTypeModalSheet(BuildContext context) {
    showTransactionTypesModalBottomSheet(context).then((value) {
      if (value != null) {
        _cubit.updateType(value);
      }
    });
  }

  Icon buildIcon() {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: AppPalette.blackHeadlineColor,
      size: 2.5.h,
    );
  }

  String _image(String type) => AppAssets.transactionImage(type);
}
