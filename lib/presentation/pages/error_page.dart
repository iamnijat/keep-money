part of pages;

class ErrorPage extends StatelessWidget {
  final VoidCallback refreshTap;
  const ErrorPage({Key? key, required this.refreshTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      color: AppPalette.whiteColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const ErrorThumbnail(),
            ErrorOverview(
              localization,
              refreshTap: refreshTap,
            ),
          ]),
    );
  }
}
