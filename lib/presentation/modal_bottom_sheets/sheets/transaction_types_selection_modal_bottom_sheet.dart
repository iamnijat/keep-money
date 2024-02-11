part of modal_bottom_sheets;

class TransactionTypesSelectionModalBottomSheet extends StatelessWidget {
  const TransactionTypesSelectionModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionTypesSelectionCubit>(
      create: (_) => getIt<TransactionTypesSelectionCubit>()..fetchTypes(),
      child: const _TransactionTypesSelectionModalBottomSheetBody(),
    );
  }
}

class _TransactionTypesSelectionModalBottomSheetBody extends StatelessWidget {
  const _TransactionTypesSelectionModalBottomSheetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return SingleChildScrollView(
        child: Material(
            type: MaterialType.transparency,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<TransactionTypesSelectionCubit,
                              TransactionTypesSelectionState>(
                          builder: (context, state) {
                        final cubit =
                            context.read<TransactionTypesSelectionCubit>();
                        if (state == TransactionTypesSelectionState.error) {
                          return ErrorPage(refreshTap: () async {
                            await cubit.fetchTypes();
                          });
                        }
                        if (state == TransactionTypesSelectionState.loading) {
                          return const ShimmerLoadingIndicator();
                        }
                        if (state == TransactionTypesSelectionState.done) {
                          return Column(
                            children: [
                              const VerticalSpacer(4),
                              ModalBottomSheetHeader(
                                  localization
                                      .transactionTypesModalBottomSheetTitle,
                                  backTap: () => cubit.back(context)),
                              const VerticalSpacer(4),
                              TransactionTypeModalOverview(cubit),
                              const VerticalSpacer(3),
                              buildViewInsetsPadding(context),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                    ]))));
  }

  Padding buildViewInsetsPadding(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom));
  }
}
