part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheet extends StatelessWidget {
  final AppLocalizations _localization;
  final UserViewModel? _user;
  const PersonalInfoEditModalBottomSheet(
    this._localization,
    this._user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonalInfoEditModalBottomSheetCubit>(
      create: (_) => getIt<PersonalInfoEditModalBottomSheetCubit>()
        ..init(_localization, _user),
      child: _PersonalInfoEditModalBottomSheetBody(_localization, _user),
    );
  }
}

class _PersonalInfoEditModalBottomSheetBody extends StatefulWidget {
  final AppLocalizations _localization;
  final UserViewModel? _user;
  const _PersonalInfoEditModalBottomSheetBody(
    this._localization,
    this._user, {
    Key? key,
  }) : super(key: key);

  @override
  State<_PersonalInfoEditModalBottomSheetBody> createState() =>
      _PersonalInfoEditModalBottomSheetBodyState();
}

class _PersonalInfoEditModalBottomSheetBodyState
    extends State<_PersonalInfoEditModalBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
            type: MaterialType.transparency,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<PersonalInfoEditModalBottomSheetCubit,
                              PersonalInfoEditModalBottomSheetState>(
                          builder: (context, state) {
                        final cubit = context
                            .read<PersonalInfoEditModalBottomSheetCubit>();
                        if (state ==
                            PersonalInfoEditModalBottomSheetState.error) {
                          return ErrorPage(refreshTap: () async {
                            await cubit.update(context, mounted);
                          });
                        }
                        return Column(
                          children: [
                            const VerticalSpacer(4),
                            ModalBottomSheetHeader(
                                widget._localization
                                    .personalInfoEditModalBottomSheetTitle,
                                backTap: () => cubit.back(context)),
                            const VerticalSpacer(3),
                            PersonalInfoEditModalBottomSheetForm(
                                widget._localization, cubit, state,
                                user: widget._user),
                            buildViewInsetsPadding(context),
                          ],
                        );
                      }),
                    ]))));
  }

  Padding buildViewInsetsPadding(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom));
  }
}
