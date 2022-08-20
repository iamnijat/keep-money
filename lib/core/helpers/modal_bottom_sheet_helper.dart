import '../../data/models/view_model/user_view_model/user_view_model.dart';
import '../../presentation/modal_bottom_sheets/index.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/palette.dart';
import '../constants/styles.dart';

void showPersonalInfoModalBottomSheet(
    context, AppLocalizations localization) async {
  return showMaterialModalBottomSheet(
    backgroundColor: AppPalette.whiteColor,
    shape: AppStyles.modalBottomSheetShapeDecorationStyle,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) =>
        PersonalInfoModalBottomSheet(localization),
  );
}

void showPersonalInfoEditModalBottomSheet(
    context, AppLocalizations localization,
    {required UserViewModel? user}) async {
  return showMaterialModalBottomSheet(
    backgroundColor: AppPalette.whiteColor,
    shape: AppStyles.modalBottomSheetShapeDecorationStyle,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) =>
        PersonalInfoEditModalBottomSheet(localization, user),
  );
}

Future showAddTransactionModalBottomSheet(
    context, AppLocalizations localization) async {
  return showMaterialModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) =>
          AddTransactionModalBottomSheet(localization));
}

Future showProfilePreferencesModalBottomSheet(
    context, AppLocalizations localization,
    {required UserViewModel? user}) async {
  return showMaterialModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) =>
          ProfilePreferencesModalBottomSheet(localization, user));
}

Future showTransactionTypesModalBottomSheet(context) async {
  return showMaterialModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) =>
          const TransactionTypesSelectionModalBottomSheet());
}
