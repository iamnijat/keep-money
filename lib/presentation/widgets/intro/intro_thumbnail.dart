part of widgets;

class IntroThumbnail extends StatelessWidget {
  const IntroThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
        child: Container(
      height: 50.h,
      width: 50.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: svg_provider.Svg(AppAssets.introImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    ));
  }
}
