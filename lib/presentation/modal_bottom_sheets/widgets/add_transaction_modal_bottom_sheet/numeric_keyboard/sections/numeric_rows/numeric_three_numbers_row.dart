part of modal_bottom_sheets;

class NumericThreeNumbersRow extends StatelessWidget {
  final List<String> _numbers;
  final AddTransactionCubit _cubit;
  const NumericThreeNumbersRow(this._numbers, this._cubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 66.w,
      decoration: const BoxDecoration(color: AppPalette.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _cubit.insertNumberToAmount(_numbers[0]),
            child: Container(
              height: 8.h,
              width: 22.w,
              decoration: const BoxDecoration(
                  color: AppPalette.whiteColor,
                  border: Border(
                    right: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
                    bottom: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
                  )),
              child: Center(
                child: Text(_numbers[0],
                    style: AppStyles.mainBlueColor14spw700Montserrat),
              ),
            ),
          ),
          InkWell(
            onTap: () => _cubit.insertNumberToAmount(_numbers[1]),
            child: Container(
              height: 8.h,
              width: 22.w,
              decoration: const BoxDecoration(
                  color: AppPalette.whiteColor,
                  border: Border(
                      right: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
                      bottom:
                          AppStyles.numericKeyboardDarkGrayBorderSideStyle)),
              child: Center(
                child: Text(_numbers[1],
                    style: AppStyles.mainBlueColor14spw700Montserrat),
              ),
            ),
          ),
          InkWell(
            onTap: () => _cubit.insertNumberToAmount(_numbers[2]),
            child: Container(
              height: 8.h,
              width: 22.w,
              decoration: const BoxDecoration(
                  color: AppPalette.whiteColor,
                  border: Border(
                      bottom:
                          AppStyles.numericKeyboardDarkGrayBorderSideStyle)),
              child: Center(
                child: Text(_numbers[2],
                    style: AppStyles.mainBlueColor14spw700Montserrat),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
