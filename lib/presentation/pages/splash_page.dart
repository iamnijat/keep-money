part of pages;

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashPageCubit>(
      create: (_) => getIt<SplashPageCubit>()..checkRoute(context, mounted),
      child: _SplashPageBody(
        mounted: mounted,
      ),
    );
  }
}

class _SplashPageBody extends StatelessWidget {
  final bool mounted;
  const _SplashPageBody({
    Key? key,
    required this.mounted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: BlocBuilder<SplashPageCubit, SplashPageState>(
          builder: (context, state) {
        final cubit = context.read<SplashPageCubit>();

        if (state == SplashPageState.error) {
          return ErrorPage(refreshTap: () async {
            await cubit.checkRoute(context, mounted);
          });
        }

        if (state == SplashPageState.loading) {
          return buildSplashWidget();
        }

        return buildSplashWidget();
      }),
    );
  }

  Column buildSplashWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            key: const Key("splashPageIndicator"),
            height: 28.h,
            width: 28.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAssets.splashLogo),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    );
  }
}
