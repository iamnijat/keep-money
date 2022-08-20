part of widgets;

class HomeNoTransactionWidget extends StatelessWidget {
  const HomeNoTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInDown(
          child: Container(
            height: 40.h,
            width: 50.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: svg_provider.Svg(AppAssets.noTransactionImage),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Text(
          "You are saving money, great!",
          style: AppStyles.blackHeadlineColor16spw700Montserrat,
          textAlign: TextAlign.center,
        ),
        const VerticalSpacer(2),
        Text(
          'Add some transactions to cheer it up',
          style: AppStyles.greyHeadlineColor12spw500MontserratLineHeight,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
