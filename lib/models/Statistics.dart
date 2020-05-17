import 'package:mybudget/models/SumCategory.dart';

class Statistics {
  double amountAll;
  List<SumCategory> sumCategoryList;
  var list;

  Statistics({
    this.amountAll,
    this.sumCategoryList,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    var list = json['sumCategoryList'] as List;
    List<SumCategory> scl = list.map((e) => SumCategory.fromJson(e)).toList();
    return Statistics(
      amountAll: json["amountAll"],
      sumCategoryList: scl,
    );
  }
}
