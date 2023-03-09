part of router;

abstract class Routes {
  const Routes._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static BuildContext? get context => navigationKey.currentContext;

  static const String splashPage = '/';
  static const String introPage = '/introPage';
  static const String personalInformationPage = "/personalInformationPage";
  static const String homePage = "/homePage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.introPage:
        return MaterialPageRoute(builder: (_) => const IntroPage());
      case Routes.personalInformationPage:
        return MaterialPageRoute(builder: (_) => const PersonalInfoPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
