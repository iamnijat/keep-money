part of widgets;

class ErrorThumbnail extends StatelessWidget {
  const ErrorThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: svg_provider.Svg(AppAssets.errorImage),
          fit: BoxFit.fitWidth,
        )),
      ),
    );
  }
}
