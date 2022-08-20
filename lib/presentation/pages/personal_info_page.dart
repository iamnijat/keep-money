part of pages;

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacer(4),
                  const PersonalInfoThumbnail(),
                  const VerticalSpacer(3),
                  PersonalInfoOverview(localization),
                ]),
          ),
        ),
        floatingActionButton: PersonalInfoButton(localization));
  }
}
