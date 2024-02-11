part of modal_bottom_sheets;

class AddTransactionModalBottomSheet extends StatelessWidget {
  final AppLocalizations _localization;
  const AddTransactionModalBottomSheet(
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTransactionCubit>(
      create: (_) => getIt<AddTransactionCubit>(),
      child: _AddTransactionModalBottomSheetBody(_localization),
    );
  }
}

class _AddTransactionModalBottomSheetBody extends StatefulWidget {
  final AppLocalizations _localization;
  const _AddTransactionModalBottomSheetBody(
    this._localization, {
    Key? key,
  }) : super(key: key);

  @override
  State<_AddTransactionModalBottomSheetBody> createState() =>
      _AddTransactionModalBottomSheetBodyState();
}

class _AddTransactionModalBottomSheetBodyState
    extends State<_AddTransactionModalBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
            type: MaterialType.transparency,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BlocBuilder<AddTransactionCubit, AddTransactionState>(
                  builder: (context, state) {
                final cubit = context.read<AddTransactionCubit>();
                if (state == AddTransactionState.error) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: ErrorPage(refreshTap: () async {
                        await cubit.addTransaction(context, mounted);
                      }));
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
                                .addTransactionModalBottomSheetTitle,
                            backTap: () => cubit.back(context),
                          ),
                          const VerticalSpacer(4),
                          AddTransactionModalAmountField(cubit),
                          const VerticalSpacer(2),
                          const PersonalInfoModalBottomSheetDivider(),
                          const VerticalSpacer(2),
                          AddTransactionModalTypeField(
                            cubit,
                            widget._localization,
                          ),
                          const VerticalSpacer(2),
                          const PersonalInfoModalBottomSheetDivider(),
                          const VerticalSpacer(2),
                          AddTransactionModalDateField(cubit),
                          const VerticalSpacer(5),
                        ],
                      ),
                    ),
                    AddTransactionModalNumericKeyboard(cubit, state),
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
