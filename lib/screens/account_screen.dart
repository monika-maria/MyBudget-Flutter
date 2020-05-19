import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          'Konto',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: account != null
                ? Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Nazwa:  ' + account.name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black.withOpacity(0.4),
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
                            color: Colors.black.withOpacity(0.4),
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
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kwota',
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                print('poszlo do api');
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Dodaj",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBarNavigation(
        currentIndex: AccountScreen.index,
      ),
    );
  }
}
