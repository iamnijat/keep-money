part of modal_bottom_sheets;

class ModalBottomSheetHeader extends StatelessWidget {
  final String _title;
  final VoidCallback? backTap;
  const ModalBottomSheetHeader(this._title, {this.backTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(onTap: backTap, child: buildIcon()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_title,
                  style: AppStyles.blackHeadlineColor14spw700Montserrat),
            ],
          ),
        )
      ],
    );
  }

  Icon buildIcon() {
    return Icon(
      Icons.close_rounded,
      color: AppPalette.blackHeadlineColor,
      size: 3.5.h,
    );
  }
}
