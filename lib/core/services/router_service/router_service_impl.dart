part of router;

class RouterServiceImpl implements RouterService {
  @override
  void openSplashPage(BuildContext context) =>
      Navigator.pushReplacementNamed(context, Routes.splashPage);

  @override
  void openIntroPage(BuildContext context, {bool withRemoval = false}) {
    if (withRemoval) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const IntroPage()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushReplacementNamed(context, Routes.introPage);
    }
  }

  @override
  void openPersonalInformationPage(BuildContext context) =>
      Navigator.pushReplacementNamed(context, Routes.personalInformationPage);

  @override
  void openHomePage(BuildContext context) =>
      Navigator.pushReplacementNamed(context, Routes.homePage);

  @override
  void back(BuildContext context, {dynamic result}) =>
      Navigator.pop(context, result);
}
