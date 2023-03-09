part of modal_bottom_sheets;

class TransactionTypeModalOverview extends StatelessWidget {
  final TransactionTypesSelectionCubit _cubit;
  const TransactionTypeModalOverview(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 50.h),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
              itemCount: _cubit.types?.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
                  child: TransactionTypeItem(_cubit, index),
                );
              }),
        ));
  }
}
