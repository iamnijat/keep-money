part of modal_bottom_sheets;

class NumericZeroDotRow extends StatelessWidget {
  final AddTransactionCubit _cubit;
  const NumericZeroDotRow(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: const BoxDecoration(color: AppPalette.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _cubit.insertNumberToAmount('0'),
            child: Container(
              height: 8.h,
              width: 44.w,
              decoration: const BoxDecoration(
                  color: AppPalette.whiteColor,
                  border: Border(
                      right: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
                      bottom:
                          AppStyles.numericKeyboardDarkGrayBorderSideStyle)),
              child: Center(
                child:
                    Text('0', style: AppStyles.mainBlueColor14spw700Montserrat),
              ),
            ),
          ),
          InkWell(
            onTap: _cubit.insertDotToAmount,
            child: Container(
              height: 8.h,
              width: 22.w,
              decoration: const BoxDecoration(
                  color: AppPalette.whiteColor,
                  border: Border(
                      bottom:
                          AppStyles.numericKeyboardDarkGrayBorderSideStyle)),
              child: Center(
                child:
                    Text('.', style: AppStyles.mainBlueColor14spw700Montserrat),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
