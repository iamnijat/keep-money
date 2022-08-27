import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

import 'core/services/router_service/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static final navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const locale = Locale('en');
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Budget Management',
        debugShowCheckedModeBanner: false,
        navigatorKey: Routes.navigationKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: Routes.splashPage,
        onGenerateRoute: Routes.generateRoute,
        locale: locale,
        theme: ThemeData.light(),
      );
    });
  }
}
