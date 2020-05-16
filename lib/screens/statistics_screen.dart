import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:mybudget/screens/expense_add_screen.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class StatisticsScreen extends StatefulWidget {
  static const String id = '/';
  static const int index = 0;

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statystyki',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate:
                            DateTime(DateTime.now().year, DateTime.now().month),
                        initialLastDate: DateTime.now(),
//                            (DateTime.now()).add(Duration(days: 7)),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2090));
                if (picked != null && picked.length == 2) {
                  print(picked);
                }
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate:
                            DateTime(DateTime.now().year, DateTime.now().month),
                        initialLastDate: DateTime.now(),
//                            (DateTime.now()).add(Duration(days: 7)),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2090));
                if (picked != null && picked.length == 2) {
                  print(picked);
                }
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate:
                            DateTime(DateTime.now().year, DateTime.now().month),
                        initialLastDate: DateTime.now(),
//                            (DateTime.now()).add(Duration(days: 7)),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2090));
                if (picked != null && picked.length == 2) {
                  print(picked);
                }
              },
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: ExpenseAddScreen.id,
        child: Icon(
          Icons.add_shopping_cart,
        ),
        backgroundColor: kSecondaryColor,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: StatisticsScreen.index,
      ),
    );
  }
}
