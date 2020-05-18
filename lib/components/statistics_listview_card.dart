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
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            categoryName.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              color: Color(int.parse(color.replaceAll('#', '0xFF'))),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            amount.toString() + ' zł',
            style: TextStyle(
              fontSize: 24,
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
        borderRadius: BorderRadius.circular(40.0),
      ),
    );
  }
}
