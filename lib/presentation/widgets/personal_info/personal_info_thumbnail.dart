part of widgets;

class PersonalInfoThumbnail extends StatelessWidget {
  const PersonalInfoThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 7.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: svg_provider.Svg(AppAssets.personalInfoThumbnail),
          fit: BoxFit.fitWidth,
        )),
      ),
    );
  }
}
