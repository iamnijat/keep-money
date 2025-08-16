import 'package:flutter/material.dart';
import 'package:keep_money/l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

import 'core/services/router_service/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  static final navigationKey = GlobalKey<NavigatorState>();

  static const locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Keep Money',
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
