import '../../core/constants/durations.dart';
import '../../core/utils/graphql/graphql_queries.dart';
import '../../data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';
import '../../domain/use_cases/transaction_types_use_cases/get_transaction_types.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/services/router_service/index.dart';

enum TransactionTypesSelectionState { initial, loading, error, done }

class TransactionTypesSelectionCubit
    extends Cubit<TransactionTypesSelectionState> {
  TransactionTypesSelectionCubit({
    required this.getTransactionTypes,
    required this.navigation,
  }) : super(TransactionTypesSelectionState.initial);

  final GetTransactionTypes getTransactionTypes;
  final RouterService navigation;

  /// RxDart Stream Controllers
  final _typesSelectionController = BehaviorSubject<TransactionTypeViewModel>();

  List<TransactionTypeViewModel>? types = <TransactionTypeViewModel>[];

  Future<void> fetchTypes() async {
    _emittingState(TransactionTypesSelectionState.loading);

    final getTransactionTypesResult = await getTransactionTypes(
        const Params(query: GraphQlQueries.transactionTypesQuery));

    getTransactionTypesResult.when(error: (_) {
      _emitErrorState();
      return;
    }, success: (typesData) async {
      types = typesData;
      _emitSuccessState();
    });
  }

  void _emitSuccessState() {
    if (types!.isEmpty) {
      _emittingState(TransactionTypesSelectionState.error);
    }
    if (types!.isNotEmpty) {
      _emittingState(TransactionTypesSelectionState.done);
      Fimber.d('Successfully fetched transaction types');
    }
  }

  void selectType(
    TransactionTypeViewModel typeModel,
    BuildContext context,
    bool mounted,
  ) async {
    _typesSelectionController.add(typeModel);

    await _addDelay(DurationsUtil.oneHundredMillisecondsDuration);
    if (!mounted) return;
    back(context, args: typeModel);
  }

  void _emitErrorState() {
    _emittingState(TransactionTypesSelectionState.error);
    Fimber.d('Error happened while fetching transaction types');
  }

  void _emittingState(TransactionTypesSelectionState state) => emit(state);

  void back(BuildContext context, {dynamic args}) =>
      navigation.back(context, result: args);

  _addDelay(Duration delay) async => await Future.delayed(delay);

  @override
  Future<void> close() {
    _typesSelectionController.close();
    return super.close();
  }
}

extension TransactionTypesSelectionCubitTypeSelectionControllerRxExtension
    on TransactionTypesSelectionCubit {
  Stream<TransactionTypeViewModel> get typesSelectionStream =>
      _typesSelectionController.stream;
}

///  Fields Extension
extension TransactionTypesSelectionCubitFieldsExtension
    on TransactionTypesSelectionCubit {
  String transactionTitle(int i) => types![i].title.toString();

  String transactionType(int i) => types![i].type.toString();
}
