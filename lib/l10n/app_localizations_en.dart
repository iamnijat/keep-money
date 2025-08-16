// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get introPageTitlePart1 => 'Your money saving';

  @override
  String get introPageTitlePart2 => 'buddy';

  @override
  String get introPageDesc =>
      'Struggled before to save hard earned money? We\'ll help you';

  @override
  String get introPageButtonText => 'Next';

  @override
  String get personalInfoModalBottomSheetTitle => 'Authentication';

  @override
  String get personalInfoTitle => 'Could you fill out your personal info?';

  @override
  String get personalInfoDesc =>
      'We need them to define your identity to track your expenses and your name has to be unique.';

  @override
  String get personalInfoFormNameTitle => 'Your Name';

  @override
  String get personalInfoFormIncomeTitle => 'Your Income';

  @override
  String get personalInfoFormNameHintText => 'Enter your name ..';

  @override
  String get personalInfoFormIncomeHintText => 'Enter your income ..';

  @override
  String homeBudgetOverviewHello(String? name) {
    return 'Hello, $name';
  }

  @override
  String get homeBudgetOverviewAddTransaction => 'Add Transaction';

  @override
  String homeBudgetOverviewBudgetSpentDesc(String? income) {
    return 'You\'ve spent ₼ $income budgeting';
  }

  @override
  String homeBudgetOverviewBudgetDesc(String? income) {
    return 'Out off ₼ $income budgeting';
  }

  @override
  String get homePageTodayTitle => 'Today';

  @override
  String get addTransactionModalBottomSheetTitle => 'Add Transaction';

  @override
  String get transactionTypesModalBottomSheetTitle => 'Transaction Types';

  @override
  String get addTransactionSelectTypeTitle => 'Please, select type';

  @override
  String get errorPageTitle => 'Oh no, something went wrong!';

  @override
  String get errorPageDesc => 'The page you requested caught on fire!';

  @override
  String get errorPageRefreshButton => 'Extinguish it';

  @override
  String get errorInternetConnection =>
      'You have an internet connection problem';

  @override
  String get profilePreferencesModalBottomSheetTitle => 'Profile';

  @override
  String get profilePreferencesModalBottomSheetTitleMaleGender => 'Male';

  @override
  String get profilePreferencesModalBottomSheetTitleFemaleGender => 'Female';

  @override
  String get profilePreferencesModalBottomSheetProfileTitle => 'Profile';

  @override
  String get profilePreferencesModalBottomSheetLogoutTitle => 'Log out';

  @override
  String get personalInfoEditModalBottomSheetTitle => 'Edit Profile';
}
