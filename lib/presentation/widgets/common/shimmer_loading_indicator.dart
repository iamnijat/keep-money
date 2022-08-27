part of widgets;

class ShimmerLoadingIndicator extends StatelessWidget {
  const ShimmerLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainGreyShimmer(
        context,
        ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding:
                      index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 4.5.h,
                          width: 4.5.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppPalette.fifthGrayColor)),
                      const HorizontalSpacer(4),
                      Container(
                          height: 4.5.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppPalette.fifthGrayColor)),
                    ],
                  ));
            }));
  }
}
