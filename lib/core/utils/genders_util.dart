import 'package:keep_money/l10n/app_localizations.dart';

abstract class GendersUtil {
  const GendersUtil._();

  static List<String> getGenders(AppLocalizations localization) {
    return [
      localization.profilePreferencesModalBottomSheetTitleMaleGender,
      localization.profilePreferencesModalBottomSheetTitleFemaleGender,
    ];
  }
}
