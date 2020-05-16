import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = '/categories_screen';
  static const int index = 0;

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
          'Kategorie',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(),
      bottomNavigationBar: TabBarNavigation(
        currentIndex: CategoriesScreen.index,
      ),
    );
  }
}
