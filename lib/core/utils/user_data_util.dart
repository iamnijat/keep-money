import '../../data/models/hive_adapters/transaction_view_model/transaction_view_model.dart';
import '../../data/models/hive_adapters/user_view_model/user_view_model.dart';

abstract class UserDataUtil {
  const UserDataUtil._();

  static UserViewModel? getUser({dynamic user}) {
    UserViewModel? userModel;
    List<TransactionViewModel> transactions = <TransactionViewModel>[];

    if (user != null) {
      List? a = user['transactions'];
      if (a!.isNotEmpty) {
        transactions = a.map((element) {
          return TransactionViewModel(
              id: element['id'],
              title: element['title'],
              type: element['type'],
              currency: element['currency'],
              createdAt: element['created_at'],
              userId: element['userId'],
              amount: element['amount'].toString());
        }).toList();
      }

      userModel = UserViewModel(
          id: user['id'],
          name: user['name'],
          gender: user['gender'],
          income: user['income'].toString(),
          transactions: transactions);
    }

    return userModel;
  }
}
