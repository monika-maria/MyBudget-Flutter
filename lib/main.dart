import 'package:flutter/material.dart';
import 'package:mybudget/screens/categories_screen.dart';
import 'package:mybudget/screens/expense_add_screen.dart';
import 'package:mybudget/screens/welcome_screen.dart';
import 'constants.dart';
import "screens/account_screen.dart";
import "screens/expenses_screen.dart";
import "screens/orders_screen.dart";
import "screens/statistics_screen.dart";

void main() => runApp(MyBudgetApp());

class MyBudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: kPrimaryColor),
      initialRoute: StatisticsScreen.id,
      routes: {
        StatisticsScreen.id: (context) => StatisticsScreen(),
        ExpenseAddScreen.id: (context) => ExpenseAddScreen(),
        ExpensesScreen.id: (context) => ExpensesScreen(),
//        OrdersScreen.id: (context) => OrdersScreen(),
        AccountScreen.id: (context) => AccountScreen(),
//        CategoriesScreen.id: (context) => CategoriesScreen()
      },
    );
  }
}
