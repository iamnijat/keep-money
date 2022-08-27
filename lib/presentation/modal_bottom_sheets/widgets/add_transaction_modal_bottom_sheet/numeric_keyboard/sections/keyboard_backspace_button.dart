part of modal_bottom_sheets;

class KeyboardBackspaceButton extends StatelessWidget {
  final VoidCallback _onTap;
  const KeyboardBackspaceButton(this._onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 8.h,
        width: 34.w,
        decoration: const BoxDecoration(
            color: AppPalette.fourthGrayColor,
            border: Border(
              left: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
              bottom: AppStyles.numericKeyboardDarkGrayBorderSideStyle,
            )),
        child: buildIcon(),
      ),
    );
  }

  Icon buildIcon() {
    return Icon(Icons.backspace, size: 3.h, color: AppPalette.mainOrangeColor);
  }
}
