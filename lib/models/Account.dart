class Account {
  int accountId;
  String name;
  double balance;
  int userId;

  Account({
    this.accountId,
    this.name,
    this.balance,
    this.userId,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json["accountId"],
      name: json["name"],
      balance: json["balance"],
      userId: json["userId"],
    );
  }
}
