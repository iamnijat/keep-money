part of router;

abstract class RouterService {
  void openSplashPage(BuildContext context);

  void openIntroPage(BuildContext context, {bool withRemoval = false});

  void openPersonalInformationPage(BuildContext context);

  void openHomePage(BuildContext context);

  void back(BuildContext context, {dynamic result});
}
