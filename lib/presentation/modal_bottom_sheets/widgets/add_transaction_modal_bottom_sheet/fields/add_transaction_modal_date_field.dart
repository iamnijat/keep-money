part of modal_bottom_sheets;

class AddTransactionModalDateField extends StatelessWidget {
  final AddTransactionCubit _cubit;
  const AddTransactionModalDateField(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _showDatePicker(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 4.5.h,
              width: 4.5.h,
              decoration: const BoxDecoration(
                  color: AppPalette.mainBlueColor, shape: BoxShape.circle),
              child: Center(child: buildIcon()),
            ),
            const HorizontalSpacer(4),
            StreamBuilder<String>(
                stream: _cubit.dateStream,
                initialData: _cubit.dateValue,
                builder: (context, snapshot) {
                  final dateValue = snapshot.data;
                  return Text((dateValue.toString()),
                      style: AppStyles.blackHeadlineColor14spw700Montserrat);
                }),
          ],
        ));
  }

  SvgPicture buildIcon() {
    return SvgPicture.asset(
      AppAssets.dateIcon,
      height: 2.1.h,
      width: 2.1.h,
      colorFilter: const ColorFilter.mode(
        AppPalette.whiteColor,
        BlendMode.srcIn,
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoDatePicker(context,
        text: 'Done',
        child: DatePicker(_cubit.updateDate),
        onClicked: () => _cubit.back(context));
  }
}
