import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';

class TabBarNavigation extends StatefulWidget {
  TabBarNavigation({@required this.currentIndex});

  final int currentIndex;
  @override
  _TabBarNavigationState createState() =>
      _TabBarNavigationState(currentIndex: currentIndex);
}

class _TabBarNavigationState extends State<TabBarNavigation> {
  _TabBarNavigationState({this.currentIndex});

  int currentIndex;

  void changeScreen(index) {
    switch (index) {
      case 0:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }
        break;

      case 1:
        {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/expenses_screen', (Route<dynamic> route) => false);
        }
        break;

      case 2:
        {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/orders_screen', (Route<dynamic> route) => false);
        }
        break;

      case 3:
        {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/account_screen', (Route<dynamic> route) => false);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF660066),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white.withOpacity(0.2),
      elevation: 10,
      onTap: (index) {
        setState(() {
          changeScreen(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info,
          ),
          title: Text(
            'Statystyki',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.monetization_on,
          ),
          title: Text(
            'Wydatki',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_border,
          ),
          title: Text(
            'Zlecenia',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_balance_wallet,
          ),
          title: Text(
            'Konto',
          ),
        ),
      ],
    );
  }
}
