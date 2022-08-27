part of modal_bottom_sheets;

class KeyboardRecentValues extends StatelessWidget {
  final AddTransactionCubit _cubit;
  const KeyboardRecentValues(this._cubit, {Key? key}) : super(key: key);

  static List<String> defaultValues = ["14.99", "20.00", "50.00"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 100.w,
      decoration: const BoxDecoration(
          color: AppPalette.fourthGrayColor,
          border: Border(
            top: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
            bottom: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildDefaultValue(
            defaultValues[0],
            const BoxDecoration(color: AppPalette.fourthGrayColor),
          ),
          buildDefaultValue(
            defaultValues[1],
            const BoxDecoration(
                color: AppPalette.fourthGrayColor,
                border: Border(
                    left: AppStyles.numericKeyboardDarkGrayBorderSideStyle)),
          ),
          buildDefaultValue(
            defaultValues[2],
            const BoxDecoration(
                color: AppPalette.fourthGrayColor,
                border: Border(
                  left: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
                )),
          ),
        ],
      ),
    );
  }

  InkWell buildDefaultValue(String value, Decoration? decoration) {
    return InkWell(
      onTap: () => _cubit.insertRecentValueToAmount(value),
      child: Container(
        height: 5.h,
        width: 33.w,
        decoration: decoration,
        child: Center(
          child: Text(value,
              style: AppStyles.blackHeadlineColor10spw500Montserrat),
        ),
      ),
    );
  }
}
