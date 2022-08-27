import '../transaction_view_model/transaction_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_view_model.g.dart';

@HiveType(typeId: 2)
class UserViewModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? gender;
  @HiveField(3)
  final String? income;
  @HiveField(4)
  final List<TransactionViewModel>? transactions;

  const UserViewModel(
      {this.id, this.name, this.gender, this.income, this.transactions});

  @override
  List<Object?> get props => [id, name, gender, income, transactions];
}
