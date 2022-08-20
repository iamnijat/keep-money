part of widgets;

class HomeSlideLeftTransitionWidget extends StatelessWidget {
  const HomeSlideLeftTransitionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 5.h,
        height: 5.h,
        decoration: BoxDecoration(
          color: AppPalette.redColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(Icons.delete_outline_rounded,
              color: AppPalette.whiteColor, size: 2.8.h),
        ),
      ),
    );
  }
}
