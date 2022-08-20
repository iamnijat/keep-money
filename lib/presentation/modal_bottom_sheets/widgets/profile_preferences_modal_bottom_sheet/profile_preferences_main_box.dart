part of modal_bottom_sheets;

class ProfilePreferencesMainBox extends StatelessWidget {
  final IconData? _icon;
  final String _title;
  final VoidCallback onTap;
  const ProfilePreferencesMainBox(
    this._icon,
    this._title, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 4.5.h,
              width: 4.5.h,
              decoration: BoxDecoration(
                color: AppPalette.fourthGrayColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(
                  _icon,
                  color: AppPalette.blackHeadlineColor,
                  size: 2.3.h,
                ),
              ),
            ),
            const HorizontalSpacer(4),
            Text(
              _title,
              style: AppStyles.blackHeadlineColor13spw700Montserrat,
            ),
          ]),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppPalette.blackHeadlineColor,
            size: 2.5.h,
          ),
        ]));
  }
}
