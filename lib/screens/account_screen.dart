import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';

class AccountScreen extends StatefulWidget {
  static const String id = '/account_screen';
  static const int index = 3;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
//    NetworkHelper.getCategories().then((categoriesFromServer) {
//      setState(() {
//        categories = categoriesFromServer;
//      });
//    });
//    PushNotificationManager pushNotificationManager = new PushNotificationManager();
//    pushNotificationManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konto',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(),
      bottomNavigationBar: TabBarNavigation(
        currentIndex: AccountScreen.index,
      ),
    );
  }
}
