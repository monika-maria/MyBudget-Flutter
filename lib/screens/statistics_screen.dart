import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:mybudget/components/statistics_listview_card.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:mybudget/models/SumCategory.dart';
import 'package:mybudget/screens/expense_add_screen.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:mybudget/models/Statistics.dart';
import 'package:mybudget/services/NetworkHelper.dart';

class StatisticsScreen extends StatefulWidget {
  static const String id = '/';
  static const int index = 0;

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Statistics statistics;

  @override
  void initState() {
    super.initState();
    NetworkHelper.getStatistics().then((statisticsFromServer) {
      setState(() {
        statistics = statisticsFromServer;
      });
    });
  }

  DateTime dateFrom = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime dateTo = DateTime.now();
  String dateFromString = DateFormat('yyyy-MM-dd')
      .format(DateTime(DateTime.now().year, DateTime.now().month));
  String dateToString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void updateDates(DateTime _dateFrom, DateTime _dateTo) {
    dateFromString = DateFormat('yyyy-MM-dd').format(_dateFrom);
    dateToString = DateFormat('yyyy-MM-dd').format(_dateTo);
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
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.calendar_today,
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
                        size: 35.0,
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
            flex: 7,
            child: statistics != null
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: statistics.sumCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StatisticsListViewCard(
                        amount:
                            statistics.sumCategoryList[index].amountCategory,
                        categoryName:
                            statistics.sumCategoryList[index].categoryName,
                        color: statistics.sumCategoryList[index].color,
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
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            flex: 10,
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
                  borderRadius: BorderRadius.circular(40.0),
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
          Icons.loupe, //t,
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
