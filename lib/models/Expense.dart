class Expense {
  int expenseId;
  String name;
  String description;
  double amount;
  String date;
  bool isOrder;
  int categoryId;
  String categoryName;
  String color;
  int userId;

  Expense({
    this.expenseId,
    this.name,
    this.description,
    this.amount,
    this.date,
    this.isOrder,
    this.categoryId,
    this.categoryName,
    this.color,
    this.userId,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      expenseId: json["expenseId"],
      name: json["name"],
      description: json["description"],
      amount: json["amount"],
      date: json["date"],
      isOrder: json["isOrder"],
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      color: json["color"],
      userId: json["userId"],
    );
  }
}
