import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybudget/components/floating_action_button.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:mybudget/models/Expense.dart';

class ExpenseScreen extends StatefulWidget {
  static const String id = '/expense_screen';
  static const int index = 0;

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
//  List<Category> categories = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Expense arguments =
        ModalRoute.of(context).settings.arguments as Expense;
    final int expenseId = arguments.expenseId;
    final String name = arguments.name;
    final String description = arguments.description;
    final double amount = arguments.amount;
    final String date =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(arguments.date));
    final String categoryName = arguments.categoryName;
    final String color = arguments.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rachunek',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(),
      floatingActionButton: getFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: ExpenseScreen.index,
      ),
    );
  }
}
