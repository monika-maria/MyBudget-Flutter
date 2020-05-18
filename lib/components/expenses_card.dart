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
        borderRadius: BorderRadius.circular(40.0),
      ),
      margin: EdgeInsets.only(top: 15),
      color: Color(0xFFE7E4F0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Icon(
          Icons.wb_sunny,
          size: 40.0,
          color: Color(int.parse(color.replaceAll('#', '0xFF'))),
        ),
        title: Text(
          categoryName.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            color: Color(int.parse(color.replaceAll('#', '0xFF'))),
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Color(int.parse(color.replaceAll('#', '0xFF'))),
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          amount.toString() + ' zł',
          style: TextStyle(
            fontSize: 27,
            color: Color(int.parse(color.replaceAll('#', '0xFF'))),
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => _showExpenseDetails(context),
      ),
    );
  }
}
