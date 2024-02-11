part of modal_bottom_sheets;

class AddTransactionModalAmountField extends StatelessWidget {
  final AddTransactionCubit _cubit;
  const AddTransactionModalAmountField(this._cubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                  color: AppPalette.mainOrangeColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'AZN',
                style: AppStyles.whiteColor12spw600Montserrat,
              ),
            ),
            const HorizontalSpacer(4),
            StreamBuilder<String>(
                stream: _cubit.amountStream,
                builder: (context, snapshot) {
                  final amountValue = snapshot.data;
                  return AnimatedSwitcher(
                      duration:
                          DurationsUtil.twoHundredFiftyMillisecondsDuration,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) =>
                              ScaleTransition(scale: animation, child: child),
                      child: Text(
                        amountValue.toString(),
                        style: AppStyles
                            .blackHeadlineColor20spw700MontserratLetterSpacing,
                        key: UniqueKey(),
                      ));
                }),
          ],
        ));
  }
}
