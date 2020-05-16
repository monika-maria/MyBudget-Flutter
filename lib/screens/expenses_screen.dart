import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';

class ExpensesScreen extends StatefulWidget {
  static const String id = '/expenses_screen';
  static const int index = 1;

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
//  List<Category> categories = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rachunki',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(),
      bottomNavigationBar: TabBarNavigation(
        currentIndex: ExpensesScreen.index,
      ),
    );
  }
}
