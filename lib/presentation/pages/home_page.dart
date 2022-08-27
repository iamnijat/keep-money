part of pages;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => getIt<HomePageCubit>()..fetchUser(),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppPalette.mainOrangeColor,
      body:
          BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
        final cubit = context.read<HomePageCubit>();

        if (state == HomePageState.error) {
          return ErrorPage(refreshTap: () async {
            await cubit.fetchUser();
          });
        }

        return Column(children: <Widget>[
          HomeBudgetOverviewbox(localization, cubit, state),
          HomeBudgetDetailsBox(localization, cubit, state)
        ]);
      }),
    );
  }
}
