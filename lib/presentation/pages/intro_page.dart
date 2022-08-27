part of pages;

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IntroPageCubit>(
      create: (_) => getIt<IntroPageCubit>(),
      child: const _IntroPageBody(),
    );
  }
}

class _IntroPageBody extends StatelessWidget {
  const _IntroPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<IntroPageCubit, IntroPageState>(
        builder: (context, state) {
      final cubit = context.read<IntroPageCubit>();

      return Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: Padding(
          padding: EdgeInsets.all(6.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const IntroThumbnail(),
            const VerticalSpacer(2),
            IntroOverview(localization),
            const Spacer(),
          ]),
        ),
        floatingActionButton: IntroButton(cubit, localization),
      );
    });
  }
}
