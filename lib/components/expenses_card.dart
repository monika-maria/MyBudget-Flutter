import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/screens/expense_screen.dart';

class ExpensesCard extends StatelessWidget {
  ExpensesCard({
    @required this.expenseId,
    @required this.name,
    @required this.description,
    @required this.amount,
    @required this.date,
    @required this.categoryName,
    @required this.color,
  });

  final int expenseId;
  final String name;
  final String description;
  final double amount;
  final String date;
  final String categoryName;
  final String color;

  void _showExpenseDetails(context) {
    Navigator.pushNamed(
      context,
      ExpenseScreen.id,
      arguments: {
        'expenseId': expenseId,
        'name': name,
        'description': description,
        'amount': amount,
        'date': date,
        'categoryName': categoryName,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      elevation: 10.0,
      margin: EdgeInsets.only(top: 15),
      color: Colors.white, //Color(0xFFE7E4F0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 22,
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
              Row(
                children: <Widget>[
                  Icon(
                    Icons.local_offer,
                    color: Color(int.parse(color.replaceAll('#', '0xFF'))),
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Nazwa: ' + name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(
                          0xFF272727), //Color(int.parse(color.replaceAll('#', '0xFF'))),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.note,
                    color: Color(int.parse(color.replaceAll('#', '0xFF'))),
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Opis: ' + description,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(
                          0xFF272727), //Color(int.parse(color.replaceAll('#', '0xFF'))),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.today,
                    color: Color(int.parse(color.replaceAll('#', '0xFF'))),
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Data: ' + date,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(
                          0xFF272727), //Color(int.parse(color.replaceAll('#', '0xFF'))),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                amount.toString() + ' zł',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(int.parse(color.replaceAll('#', '0xFF'))),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
