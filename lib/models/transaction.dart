//normal class , just a blueprint
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime datetime;

//constructor
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.datetime});
}
