import 'dart:async';

import '../../core/utils/genders_util.dart';
import '../../core/utils/graphql/graphql_queries.dart';
import '../../data/models/hive_adapters/user_view_model/user_view_model.dart';
import '../../domain/use_cases/user_use_cases/update_user.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/services/router_service/index.dart';

enum PersonalInfoEditModalBottomSheetState { initial, loading, error, done }

class PersonalInfoEditModalBottomSheetCubit
    extends Cubit<PersonalInfoEditModalBottomSheetState> {
  PersonalInfoEditModalBottomSheetCubit(
      {required this.updateUser, required this.navigation})
      : super(PersonalInfoEditModalBottomSheetState.initial);

  final UpdateUser updateUser;
  final RouterService navigation;

  List<String> genders = <String>[];

  /// RxDart Stream Controllers
  final _nameController = BehaviorSubject<String>();
  final _incomeController = BehaviorSubject<String>();
  final _genderController = BehaviorSubject<String>();

  void init(AppLocalizations localization, UserViewModel? user) {
    _genderController.add(user!.gender.toString());
    _nameController.add(user.name.toString());
    _incomeController.add(user.income.toString());

    genders = GendersUtil.getGenders(localization);

    if (genders.isEmpty) {
      _emitErrorState();
    }
  }

  Future<void> update(BuildContext context, bool mounted) async {
    _emittingState(PersonalInfoEditModalBottomSheetState.loading);

    final updateUserResult = await updateUser(Params(
        query: GraphQlQueries.updateUserQuery,
        variables: {
          "name": nameValue,
          "gender": genderValue,
          "income": incomeValue
        }));

    updateUserResult.when(
      error: (_) {
        _emitErrorState();
        return;
      },
      success: (result) async {
        _emittingState(PersonalInfoEditModalBottomSheetState.done);
        if (!mounted) return;
        Fimber.d('Sucessfully edited personal info');
        back(context, args: "true");
      },
    );
  }

  void updateName(String name) {
    if (_checkEmptyFormField(name)) {
      _nameController.sink.add('');
      _nameController.sink.addError('The field is empty');
    } else {
      _nameController.sink.add(name);
    }
  }

  void updateIncome(String income) {
    if (_checkEmptyFormField(income)) {
      _incomeController.sink.add('');
      _incomeController.sink.addError('The field is empty');
    } else {
      _incomeController.sink.add(income);
    }
  }

  void updateGender(String gender) => _genderController.add(gender);

  void _emittingState(PersonalInfoEditModalBottomSheetState state) =>
      emit(state);

  void _emitErrorState() {
    _emittingState(PersonalInfoEditModalBottomSheetState.error);
    Fimber.d('Error happened while editing personal info');
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
extension PersonalInfoEditModalBottomSheetCubitCheckingEmptyFormFieldExtension
    on PersonalInfoEditModalBottomSheetCubit {
  bool _checkEmptyFormField(String value) => value == '';
}

/// RxDart Extensions
extension PersonalInfoEditModalBottomSheetCubitNameControllerRxExtension
    on PersonalInfoEditModalBottomSheetCubit {
  Stream<String> get nameStream => _nameController.stream;
  String get nameValue => _nameController.value;
}

extension PersonalInfoEditModalBottomSheetCubitIncomeControllerRxExtension
    on PersonalInfoEditModalBottomSheetCubit {
  Stream<String> get incomeStream => _incomeController.stream;
  String get incomeValue => _incomeController.value;
}

extension PersonalInfoEditModalBottomSheetCubitGenderControllerRxExtension
    on PersonalInfoEditModalBottomSheetCubit {
  Stream<String> get genderStream => _genderController.stream;
  String get genderValue => _genderController.value;
}

extension PersonalInfoEditModalBottomSheetCubitFormValidationControllerRxExtension
    on PersonalInfoEditModalBottomSheetCubit {
  Stream<bool> get isFormValid =>
      Rx.combineLatest2(nameStream, incomeStream, (a, b) => true);
}

/// Text Validation
extension PPersonalInfoEditModalBottomSheetCubitTextValidationExtension
    on PersonalInfoEditModalBottomSheetCubit {
  bool get isNameEmpty => nameValue.isEmpty;
  bool get isIncomeEmpty => incomeValue.isEmpty;
}
