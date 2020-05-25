class Category {
  int categoryId;
  String name;
  String color;

  Category({this.categoryId, this.name, this.color});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json["categoryId"],
      name: json["name"],
      color: json["color"],
    );
  }
}
