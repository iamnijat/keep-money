import '../../core/extensions/string_extensions.dart';
import '../../domain/use_cases/transactions_use_cases/create_transaction.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/services/router_service/index.dart';
import '../../core/utils/date_format_util.dart';
import '../../core/utils/graphql/graphql_queries.dart';
import '../../data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';

enum AddTransactionState { initial, loading, error, done }

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit({
    required this.navigation,
    required this.createTransation,
  }) : super(AddTransactionState.initial);

  final RouterService navigation;
  final CreateTransation createTransation;

  /// RxDart Stream Controllers
  final _amountController = BehaviorSubject<String>.seeded('');
  final _typeController = BehaviorSubject<TransactionTypeViewModel>();
  final _dateTimeController = BehaviorSubject<String>.seeded(
      DateFormatUtil.monnthNameDayYearFormattedDate(DateTime.now()));

  Future<void> addTransaction(BuildContext context, bool mounted) async {
    _emittingState(AddTransactionState.loading);

    final createTransationResult = await createTransation(_getVariables);

    if (createTransationResult.isSuccess()) {
      if (!mounted) return;
      _emitSuccessState(context);
    } else {
      _emitErrorState();
      return;
    }
  }

  void updateType(TransactionTypeViewModel typeModel) =>
      _typeController.add(typeModel);

  void updateDate(DateTime date) =>
      _dateTimeController.add(_monnthNameDayYearFormattedDate(date));

  void insertNumberToAmount(String value) =>
      _amountController.add("$amountValue$value");

  void insertRecentValueToAmount(String value) {
    deleteAllDigitsOfAmount();
    _amountController.add(value);
  }

  void insertDotToAmount() =>
      !amountContainsDot ? _amountController.add("$amountValue.") : null;

  void deleteAllDigitsOfAmount() => _amountController.add('');

  void deleteDigitOneByOneFromTypedValue() {
    if (amountValue.isNotEmpty) {
      _amountController.add(amountValue.deleteLastCharacter);
    } else {
      _amountController.add('');
    }
  }

  Params get _getVariables {
    return Params(query: GraphQlQueries.createTransactionQuery, variables: {
      "title": typeValue.title,
      "type": typeValue.type,
      "currency": "AZN",
      "created_at": dateValue,
      "amount": amountValue,
    });
  }

  void back(BuildContext context, {dynamic args}) =>
      navigation.back(context, result: args);

  void _emittingState(AddTransactionState state) => emit(state);

  void _emitErrorState() {
    _emittingState(AddTransactionState.error);
    Fimber.d('Error happened while adding new transaction');
  }

  void _emitSuccessState(BuildContext context) {
    _emittingState(AddTransactionState.done);
    Fimber.d('New transaction has been added successfully');
    back(context, args: 'success');
  }

  @override
  Future<void> close() {
    _amountController.close();
    _typeController.close();
    _dateTimeController.close();
    return super.close();
  }
}

/// RxDart Extensions
extension AddTransactionCubitAmountControllerRxExtension
    on AddTransactionCubit {
  Stream<String> get amountStream => _amountController.stream;
  String get amountValue => _amountController.value;
}

extension AddTransactionCubitTypeControllerRxExtension on AddTransactionCubit {
  Stream<TransactionTypeViewModel> get typeStream => _typeController.stream;
  TransactionTypeViewModel get typeValue => _typeController.value;
}

extension AddTransactionCubitDateControllerRxExtension on AddTransactionCubit {
  Stream<String> get dateStream => _dateTimeController.stream;
  String get dateValue => _dateTimeController.value;
}

extension AddTransactionCubitFormValidationControllerRxExtension
    on AddTransactionCubit {
  Stream<bool> get validateForm => Rx.combineLatest3(
      amountStream, typeStream, dateStream, (a, b, c) => true);
}

/// Current Date
extension AddTransactionCubitFormattedDateExtension on AddTransactionCubit {
  String _monnthNameDayYearFormattedDate(DateTime date) =>
      DateFormatUtil.monnthNameDayYearFormattedDate(date);
}

/// Text Validation
extension AddTransactionCubitAmountValidationExtension on AddTransactionCubit {
  bool get isAmountEmpty => amountValue.isEmpty;
  bool get amountContainsDot => amountValue.toString().contains('.');
  bool get isLastOfAmountContainsDot => amountValue.isNotEmpty
      ? amountValue.toString().characters.last == '.'
      : false;
}
