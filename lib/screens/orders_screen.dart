import 'package:flutter/material.dart';
import 'package:mybudget/components/floating_action_button.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';

class OrdersScreen extends StatefulWidget {
  static const String id = '/orders_screen';
  static const int index = 2;

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
//  List<Category> categories = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Stałe zlecenia',
            style: kAppBarTextStyle,
          ),
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(),
      floatingActionButton: getFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: OrdersScreen.index,
      ),
    );
  }
}
