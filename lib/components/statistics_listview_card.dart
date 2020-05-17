import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';

class StatisticsListViewCard extends StatelessWidget {
  StatisticsListViewCard(
      {@required this.categoryName,
      @required this.amount,
      @required this.color});

  final String categoryName;
  final double amount;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            categoryName.toUpperCase(),
            style: TextStyle(
              fontSize: 28,
              color: Color(int.parse(color.replaceAll('#', '0xFF'))),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            amount.toString() + ' zł',
            style: TextStyle(
              fontSize: 28,
              color: Color(int.parse(color.replaceAll('#', '0xFF'))),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color(0xFFE7E4F0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
