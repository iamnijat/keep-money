import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/date_format_util.dart';
import '../../core/utils/graphql/graphql_queries.dart';
import '../../data/models/hive_adapters/transaction_view_model/transaction_view_model.dart';
import '../../data/models/hive_adapters/user_view_model/user_view_model.dart';
import '../../domain/use_cases/transactions_use_cases/remove_transaction.dart';
import '../../domain/use_cases/user_use_cases/get_user.dart';

enum HomePageState { initial, loading, empty, error, done }

class HomePageCubit extends Cubit<HomePageState> {
  final GetUser getUser;
  final RemoveTransation removeTransation;
  HomePageCubit({required this.getUser, required this.removeTransation})
      : super(HomePageState.initial);

  UserViewModel? user;
  List<TransactionViewModel> transactions = <TransactionViewModel>[];

  Future<void> fetchUser() async {
    _emittingState(HomePageState.loading);

    final getUserResult =
        await getUser(GetUserParams(query: GraphQlQueries.transactionsQuery));

    getUserResult.when(error: (_) {
      _emitErrorState();
      return;
    }, success: (userData) async {
      user = userData;
      transactions = user!.transactions!;
      _emitSuccessState();
    });
  }

  Future<void> removeTransaction(String? id) async {
    final removeTransactionResult = await removeTransation(Params(
        query: GraphQlQueries.removeTransactionQuery, variables: {"id": id}));

    if (removeTransactionResult.isSuccess()) {
      fetchUser();
    } else {
      _emitErrorState();
      return;
    }
  }

  void _emitSuccessState() {
    if (transactions.isEmpty) {
      _emittingState(HomePageState.empty);
    }
    if (transactions.isNotEmpty) {
      _emittingState(HomePageState.done);
    }
    Fimber.d('Successfully fetched user data and all transactions');
  }

  void _emitErrorState() {
    _emittingState(HomePageState.error);
    Fimber.d('Error happened while fetching user data and all transactions');
  }

  void _emittingState(HomePageState state) => emit(state);
}

/// Calculate Expense Extension
extension HomePageCubitCalculateExpenseExtension on HomePageCubit {
  double get expense => transactions.sumUp;
}

/// Calculate Today's Expense Extension
extension HomePageCubitCalculateTodaysExpenseExtension on HomePageCubit {
  String get todayExpense {
    final todaysList = transactions
        .where((element) => element.createdAt == currentDate)
        .toList();
    return todaysList.isEmpty ? "0.0" : todaysList.sumUp.toStringAsFixed(1);
  }
}

/// Current Date
extension HomePageCubitCurrentDateExtension on HomePageCubit {
  String get currentDate =>
      DateFormatUtil.monnthNameDayYearFormattedDate(DateFormatUtil.currentTime);
}

extension Sum<E extends num> on List {
  double get sumUp => map((item) => double.parse(item.amount.toString()))
      .reduce((value, current) => value + current);
}
