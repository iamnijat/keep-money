part of modal_bottom_sheets;

class ProfilePreferencesModalBottomSheet extends StatelessWidget {
  final AppLocalizations _localization;
  final UserViewModel? _user;
  const ProfilePreferencesModalBottomSheet(
    this._localization,
    this._user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePreferencesCubit>(
      create: (_) => getIt<ProfilePreferencesCubit>(),
      child: _ProfilePreferencesModalBottomSheetBody(_localization, _user),
    );
  }
}

class _ProfilePreferencesModalBottomSheetBody extends StatefulWidget {
  final AppLocalizations _localization;
  final UserViewModel? _user;
  const _ProfilePreferencesModalBottomSheetBody(
    this._localization,
    this._user, {
    Key? key,
  }) : super(key: key);
  @override
  State<_ProfilePreferencesModalBottomSheetBody> createState() =>
      _ProfilePreferencesModalBottomSheetBodyState();
}

class _ProfilePreferencesModalBottomSheetBodyState
    extends State<_ProfilePreferencesModalBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
            type: MaterialType.transparency,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BlocBuilder<ProfilePreferencesCubit, ProfilePreferencesState>(
                  builder: (context, state) {
                final cubit = context.read<ProfilePreferencesCubit>();
                if (state == ProfilePreferencesState.error) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: ErrorPage(refreshTap: () async {}));
                }
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacer(4),
                          ModalBottomSheetHeader(
                            widget._localization
                                .profilePreferencesModalBottomSheetTitle,
                            backTap: () => cubit.back(context),
                          ),
                          const VerticalSpacer(5),
                          ProfilePreferencesMainBox(
                            Icons.info_outline_rounded,
                            widget._localization
                                .profilePreferencesModalBottomSheetProfileTitle,
                            onTap: () {
                              showPersonalInfoEditModalBottomSheet(
                                      context, widget._localization,
                                      user: widget._user)
                                  .then((value) {
                                if (value != null) {
                                  context.read<HomePageCubit>().fetchUser();
                                }
                              });
                            },
                          ),
                          const VerticalSpacer(3),
                          ProfilePreferencesMainBox(
                            Icons.logout_rounded,
                            widget._localization
                                .profilePreferencesModalBottomSheetLogoutTitle,
                            onTap: () async {
                              await cubit.logOut(context, mounted);
                            },
                          ),
                          const VerticalSpacer(4),
                        ],
                      ),
                    ),
                    buildViewInsetsPadding(context),
                  ],
                );
              }),
            ])));
  }

  Padding buildViewInsetsPadding(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom));
  }
}
