class Payment {
  String from;
  int amount;
  String category;
  String data;
  Map<String, int> to = {};

  Payment(
      {required this.data,
      required this.from,
      required this.amount,
      required this.category,
      required this.to});
}
