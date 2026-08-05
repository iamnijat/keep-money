import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @introPageTitlePart1.
  ///
  /// In en, this message translates to:
  /// **'Your money saving'**
  String get introPageTitlePart1;

  /// No description provided for @introPageTitlePart2.
  ///
  /// In en, this message translates to:
  /// **'buddy'**
  String get introPageTitlePart2;

  /// No description provided for @introPageDesc.
  ///
  /// In en, this message translates to:
  /// **'Struggled before to save hard earned money? We\'ll help you'**
  String get introPageDesc;

  /// No description provided for @introPageButtonText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get introPageButtonText;

  /// No description provided for @personalInfoModalBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get personalInfoModalBottomSheetTitle;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Could you fill out your personal info?'**
  String get personalInfoTitle;

  /// No description provided for @personalInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'We need them to define your identity to track your expenses and your name has to be unique.'**
  String get personalInfoDesc;

  /// No description provided for @personalInfoFormNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get personalInfoFormNameTitle;

  /// No description provided for @personalInfoFormIncomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Income'**
  String get personalInfoFormIncomeTitle;

  /// No description provided for @personalInfoFormNameHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your name ..'**
  String get personalInfoFormNameHintText;

  /// No description provided for @personalInfoFormIncomeHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your income ..'**
  String get personalInfoFormIncomeHintText;

  /// No description provided for @homeBudgetOverviewHello.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String homeBudgetOverviewHello(String? name);

  /// No description provided for @homeBudgetOverviewAddTransaction.
  ///
  /// In en, this message translates to:
  /// **'Add Transaction'**
  String get homeBudgetOverviewAddTransaction;

  /// No description provided for @homeBudgetOverviewBudgetSpentDesc.
  ///
  /// In en, this message translates to:
  /// **'You\'ve spent ₼ {income} budgeting'**
  String homeBudgetOverviewBudgetSpentDesc(String? income);

  /// No description provided for @homeBudgetOverviewBudgetDesc.
  ///
  /// In en, this message translates to:
  /// **'Out off ₼ {income} budgeting'**
  String homeBudgetOverviewBudgetDesc(String? income);

  /// No description provided for @homePageTodayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homePageTodayTitle;

  /// No description provided for @addTransactionModalBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Transaction'**
  String get addTransactionModalBottomSheetTitle;

  /// No description provided for @transactionTypesModalBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction Types'**
  String get transactionTypesModalBottomSheetTitle;

  /// No description provided for @addTransactionSelectTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Please, select type'**
  String get addTransactionSelectTypeTitle;

  /// No description provided for @errorPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Oh no, something went wrong!'**
  String get errorPageTitle;

  /// No description provided for @errorPageDesc.
  ///
  /// In en, this message translates to:
  /// **'The page you requested caught on fire!'**
  String get errorPageDesc;

  /// No description provided for @errorPageRefreshButton.
  ///
  /// In en, this message translates to:
  /// **'Extinguish it'**
  String get errorPageRefreshButton;

  /// No description provided for @errorInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'You have an internet connection problem'**
  String get errorInternetConnection;

  /// No description provided for @profilePreferencesModalBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profilePreferencesModalBottomSheetTitle;

  /// No description provided for @profilePreferencesModalBottomSheetTitleMaleGender.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get profilePreferencesModalBottomSheetTitleMaleGender;

  /// No description provided for @profilePreferencesModalBottomSheetTitleFemaleGender.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get profilePreferencesModalBottomSheetTitleFemaleGender;

  /// No description provided for @profilePreferencesModalBottomSheetProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profilePreferencesModalBottomSheetProfileTitle;

  /// No description provided for @profilePreferencesModalBottomSheetLogoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get profilePreferencesModalBottomSheetLogoutTitle;

  /// No description provided for @personalInfoEditModalBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get personalInfoEditModalBottomSheetTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
