part of widgets;

class HomeTransactionItemDismissibleWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onDismissTap;
  const HomeTransactionItemDismissibleWidget(
      {Key? key, required this.child, required this.onDismissTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: Durations.oneSecondDuration,
      resizeDuration: Durations.sixHundredMillisecondsDuration,
      onDismissed: (direction) => onDismissTap(),
      background: const HomeSlideLeftTransitionWidget(),
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      child: child,
    );
  }
}
