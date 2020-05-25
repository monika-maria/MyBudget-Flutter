import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybudget/components/floating_action_button.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:mybudget/services/NetworkHelper.dart';
import 'package:mybudget/models/Account.dart';

class AccountScreen extends StatefulWidget {
  static const String id = '/account_screen';
  static const int index = 3;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Account account;
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    NetworkHelper.getAccount().then((accountFromServer) {
      setState(() {
        account = accountFromServer;
      });
    });
//    PushNotificationManager pushNotificationManager = new PushNotificationManager();
//    pushNotificationManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Konto',
            style: kAppBarTextStyle,
          ),
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 10.0,
            ),
          ),
          Expanded(
            flex: 5,
            child: account != null
                ? Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Nazwa:  ' + account.name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(
                                0xFF660066), //Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: Text(
                          'Saldo:  ' + account.balance.toString() + ' zł',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(
                                0xFF660066), // Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.announcement,
                          size: 100,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                          'Wczytywanie ...',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                controller: amountController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  hintText: 'WPROWADŹ KWOTĘ',
                  filled: true,
                  fillColor: Colors.black12,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 80.0,
              ),
              child: RaisedButton(
                child: Text(
                  'DODAJ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lato',
                    fontSize: 16,
                  ),
                ),
                color: Color(0xFF660066),
                splashColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  final double amount = double.parse(amountController.text);
                  NetworkHelper.updateBalance(amount);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: getFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: AccountScreen.index,
      ),
    );
  }
}
