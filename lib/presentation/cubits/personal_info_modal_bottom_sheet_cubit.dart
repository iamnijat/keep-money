import 'dart:async';

import '../../core/utils/genders_util.dart';
import '../../core/utils/graphql/graphql_queries.dart';
import '../../domain/use_cases/auth_use_cases/register_user.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/services/router_service/index.dart';

enum PersonalInfoModalBottomSheetState { initial, loading, error, done }

class PersonalInfoModalBottomSheetCubit
    extends Cubit<PersonalInfoModalBottomSheetState> {
  PersonalInfoModalBottomSheetCubit(
      {required this.registerUser, required this.navigation})
      : super(PersonalInfoModalBottomSheetState.initial);

  final RegisterUser registerUser;
  final RouterService navigation;

  List<String> genders = <String>[];

  /// RxDart Stream Controllers
  final _nameController = BehaviorSubject<String>.seeded('');
  final _incomeController = BehaviorSubject<String>.seeded('');
  final _genderController = BehaviorSubject<String>.seeded('Female');

  void init(AppLocalizations localization) {
    genders = GendersUtil.getGenders(localization);

    if (genders.isEmpty) {
      _emitErrorState();
    }
  }

  Future<void> auth(BuildContext context, bool mounted) async {
    _emittingState(PersonalInfoModalBottomSheetState.loading);

    final registerUserResult = await registerUser(Params(
        query: GraphQlQueries.createUserQuery,
        variables: {
          "name": nameValue,
          "gender": genderValue,
          "income": incomeValue
        }));

    registerUserResult.when(
      error: (_) {
        _emitErrorState();
        return;
      },
      success: (result) async {
        _emittingState(PersonalInfoModalBottomSheetState.done);
        back(context);
        if (!mounted) return;
        Fimber.d('Sucessfully completed authentication part');
        navigateToHomePage(context, result.toString());
      },
    );
  }

  void updateName(String name) {
    if (_checkEmptyFormField(name)) {
      _nameController.add('');
      _nameController.addError('The field is empty');
    } else {
      _nameController.add(name);
    }
  }

  void updateIncome(String income) {
    if (_checkEmptyFormField(income)) {
      _incomeController.add('');
      _incomeController.addError('The field is empty');
    } else {
      _incomeController.add(income);
    }
  }

  void updateGender(String gender) => _genderController.add(gender);

  void _emittingState(PersonalInfoModalBottomSheetState state) => emit(state);

  void _emitErrorState() {
    _emittingState(PersonalInfoModalBottomSheetState.error);
    Fimber.d('Error happened while authentication');
  }

  void navigateToHomePage(BuildContext context, String userId) =>
      navigation.openHomePage(context);

  void back(BuildContext context, {dynamic args}) =>
      navigation.back(context, result: args);

  @override
  Future<void> close() {
    _nameController.close();
    _incomeController.close();
    return super.close();
  }
}

/// Getter for checking empty form field
extension PersonalInfoCubitCheckingEmptyFormFieldExtension
    on PersonalInfoModalBottomSheetCubit {
  bool _checkEmptyFormField(String value) => value == '';
}

/// RxDart Extensions
extension PersonalInfoCubitNameControllerRxExtension
    on PersonalInfoModalBottomSheetCubit {
  Stream<String> get nameStream => _nameController.stream;
  String get nameValue => _nameController.value;
}

extension PersonalInfoCubitIncomeControllerRxExtension
    on PersonalInfoModalBottomSheetCubit {
  Stream<String> get incomeStream => _incomeController.stream;
  String get incomeValue => _incomeController.value;
}

extension PersonalInfoCubitGenderControllerRxExtension
    on PersonalInfoModalBottomSheetCubit {
  Stream<String> get genderStream => _genderController.stream;
  String get genderValue => _genderController.value;
}

extension PersonalInfoCubitFormValidationControllerRxExtension
    on PersonalInfoModalBottomSheetCubit {
  Stream<bool> get isFormValid =>
      Rx.combineLatest2(nameStream, incomeStream, (a, b) => true);
}

/// Text Validation
extension PersonalInfoModalBottomSheetCubitTextValidationExtension
    on PersonalInfoModalBottomSheetCubit {
  bool get isNameEmpty => nameValue.isEmpty;
  bool get isIncomeEmpty => incomeValue.isEmpty;
}
