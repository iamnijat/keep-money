part of modal_bottom_sheets;

class PersonalInfoModalBottomSheet extends StatelessWidget {
  final AppLocalizations _localization;
  const PersonalInfoModalBottomSheet(
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonalInfoModalBottomSheetCubit>(
      create: (_) =>
          getIt<PersonalInfoModalBottomSheetCubit>()..init(_localization),
      child: _PersonalInfoModalBottomSheetBody(_localization),
    );
  }
}

class _PersonalInfoModalBottomSheetBody extends StatefulWidget {
  final AppLocalizations _localization;
  const _PersonalInfoModalBottomSheetBody(
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  State<_PersonalInfoModalBottomSheetBody> createState() =>
      _PersonalInfoModalBottomSheetBodyState();
}

class _PersonalInfoModalBottomSheetBodyState
    extends State<_PersonalInfoModalBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  BlocBuilder<PersonalInfoModalBottomSheetCubit,
                          PersonalInfoModalBottomSheetState>(
                      builder: (context, state) {
                    final cubit =
                        context.read<PersonalInfoModalBottomSheetCubit>();
                    if (state == PersonalInfoModalBottomSheetState.error) {
                      return ErrorPage(refreshTap: () async {
                        await cubit.auth(context, mounted);
                      });
                    }
                    return Column(
                      children: [
                        const VerticalSpacer(4),
                        ModalBottomSheetHeader(
                            widget._localization
                                .personalInfoModalBottomSheetTitle,
                            backTap: () => cubit.back(context)),
                        const VerticalSpacer(3),
                        PersonalInfoModalBottomSheetForm(
                            widget._localization, cubit, state),
                      ],
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(bottom: context.viewInsetsBottom),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                  ),
                ]))));
  }

  Padding buildViewInsetsPadding(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom));
  }
}

extension ResponsiveViewInsetsExtension on BuildContext {
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}
