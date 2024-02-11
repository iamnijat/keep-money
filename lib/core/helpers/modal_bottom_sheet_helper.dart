import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/hive_adapters/user_view_model/user_view_model.dart';
import '../../presentation/cubits/home_page_cubit.dart';
import '../../presentation/modal_bottom_sheets/index.dart';
import '../constants/palette.dart';
import '../constants/styles.dart';

void showPersonalInfoModalBottomSheet(
    context, AppLocalizations localization) async {
  return showModalBottomSheet(
    backgroundColor: AppPalette.whiteColor,
    shape: AppStyles.modalBottomSheetShapeDecorationStyle,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) =>
        PersonalInfoModalBottomSheet(localization),
  );
}

Future showPersonalInfoEditModalBottomSheet(
    context, AppLocalizations localization,
    {required UserViewModel? user}) async {
  return showModalBottomSheet(
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
  return showModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) =>
          AddTransactionModalBottomSheet(localization));
}

Future showProfilePreferencesModalBottomSheet(
    context, AppLocalizations localization,
    {required UserViewModel? user, required HomePageCubit cubit}) async {
  return showModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (_) => BlocProvider.value(
          value: cubit,
          child: ProfilePreferencesModalBottomSheet(localization, user)));
}

Future showTransactionTypesModalBottomSheet(context) async {
  return showModalBottomSheet(
      backgroundColor: AppPalette.whiteColor,
      shape: AppStyles.modalBottomSheetShapeDecorationStyle,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) =>
          const TransactionTypesSelectionModalBottomSheet());
}
