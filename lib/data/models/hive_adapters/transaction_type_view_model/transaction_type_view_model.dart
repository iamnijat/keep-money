import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'transaction_type_view_model.g.dart';

@HiveType(typeId: 1)
class TransactionTypeViewModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? type;

  const TransactionTypeViewModel({this.id, this.title, this.type});

  @override
  List<Object?> get props => [id, title, type];
}
