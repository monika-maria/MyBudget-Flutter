import 'package:flutter/material.dart';
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
        ExpensesScreen.id: (context) => ExpensesScreen(),
        OrdersScreen.id: (context) => OrdersScreen(),
        AccountScreen.id: (context) => AccountScreen()
      },
    );
  }
}
