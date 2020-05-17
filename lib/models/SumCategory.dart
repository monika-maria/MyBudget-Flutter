class SumCategory {
  int categoryId;
  String categoryName;
  double amountCategory;
  int percent;
  String color;

  SumCategory({
    this.categoryId,
    this.categoryName,
    this.amountCategory,
    this.percent,
    this.color,
  });

  factory SumCategory.fromJson(Map<String, dynamic> json) {
    return SumCategory(
      categoryId: json["categoryId"] as int,
      categoryName: json["categoryName"] as String,
      amountCategory: json["amountCategory"] as double,
      percent: json["percent"] as int,
      color: json["color"] as String,
    );
  }
}
