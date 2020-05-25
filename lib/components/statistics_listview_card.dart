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
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 180, maxWidth: 180),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
            Divider(
              color: Color(int.parse(color.replaceAll('#', '0xFF'))),
              thickness: 2.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                amount.toString() + ' zł',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(int.parse(color.replaceAll('#', '0xFF'))),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
