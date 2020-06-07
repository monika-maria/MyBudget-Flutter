import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybudget/components/expenses_card.dart';
import 'package:mybudget/components/floating_action_button.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:mybudget/models/Expense.dart';
import 'package:mybudget/screens/expense_screen.dart';
import 'package:mybudget/services/NetworkHelper.dart';
import 'package:mybudget/components/statistics_listview_card.dart';

class ExpensesScreen extends StatefulWidget {
  static const String id = '/expenses_screen';
  static const int index = 1;

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Expense> expenses;
  DateTime dateFrom = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime dateTo = DateTime.now();
  String dateFromString = DateFormat('yyyy-MM-dd')
      .format(DateTime(DateTime.now().year, DateTime.now().month));
  String dateToString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    NetworkHelper.getExpenses(dateFromString, dateToString)
        .then((expensesFromServer) {
      setState(() {
        expenses = expensesFromServer;
      });
    });
  }

  void updateDates(DateTime _dateFrom, DateTime _dateTo) {
    dateFromString = DateFormat('yyyy-MM-dd').format(_dateFrom);
    dateToString = DateFormat('yyyy-MM-dd').format(_dateTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Wydatki',
            style: kAppBarTextStyle,
          ),
        ),
        backgroundColor: kSecondaryColor,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.search,
//              color: Color(0xFF660066), //Colors.white,
//              size: 30.0,
//            ),
//            onPressed: () async {
//              final List<DateTime> picked = await DateRagePicker.showDatePicker(
//                  context: context,
//                  initialFirstDate: dateFrom,
//                  initialLastDate: dateTo,
//                  firstDate: DateTime(2015),
//                  lastDate: DateTime(2090));
//              if (picked != null && picked.length == 2) {
//                setState(() {
//                  updateDates(picked.elementAt(0), picked.elementAt(1));
//                });
//              }
//            },
//          ),
//        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate: dateFrom,
                        initialLastDate: dateTo,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2090));
                if (picked != null && picked.length == 2) {
                  setState(() {
                    updateDates(picked.elementAt(0), picked.elementAt(1));
                  });
                }
              },
              child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Color(0xFF660066), //Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        '$dateFromString' + ' do ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Text(
                        '$dateToString',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 17,
            child: expenses != null
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: expenses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpensesCard(
                        expenseId: expenses[index].expenseId,
                        name: expenses[index].name,
                        description: expenses[index].description,
                        amount: expenses[index].amount,
                        date: expenses[index].date,
                        categoryName: expenses[index].categoryName,
                        color: expenses[index].color,
                      );
                    },
                    padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
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
                          'Brak kategorii',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato'),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
//      floatingActionButton: getFloatingActionButton(context),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: ExpensesScreen.index,
      ),
    );
  }
}
