import '../../data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';

abstract class TransactionTypesUtil {
  const TransactionTypesUtil._();

  static List<TransactionTypeViewModel> getTypes({List? types}) {
    List<TransactionTypeViewModel> typesList = <TransactionTypeViewModel>[];

    if (types!.isNotEmpty) {
      typesList = types.map((element) {
        return TransactionTypeViewModel(
          id: element['id'],
          title: element['title'],
          type: element['type'],
        );
      }).toList();
    }

    return typesList;
  }
}
