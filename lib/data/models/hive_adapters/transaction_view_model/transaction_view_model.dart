import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'transaction_view_model.g.dart';

@HiveType(typeId: 3)
class TransactionViewModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final String? currency;
  @HiveField(4)
  final String? createdAt;
  @HiveField(5)
  final String? userId;
  @HiveField(6)
  final String? amount;

  const TransactionViewModel(
      {this.id,
      this.title,
      this.type,
      this.currency,
      this.createdAt,
      this.userId,
      this.amount});

  @override
  List<Object?> get props =>
      [id, title, type, currency, createdAt, userId, amount];
}
