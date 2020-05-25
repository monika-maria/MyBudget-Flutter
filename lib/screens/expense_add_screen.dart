import 'package:flutter/material.dart';
import 'package:mybudget/constants.dart';
import 'package:mybudget/components/tab_bar_navigation.dart';
import 'package:mybudget/models/Category.dart';
import 'package:mybudget/services/NetworkHelper.dart';

class ExpenseAddScreen extends StatefulWidget {
  static const String id = '/expense_add_screen';
  static const int index = 0;

  @override
  _ExpenseAddScreenState createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  List<Category> categories = List();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dodaj rachunek',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
//                        final List<DateTime> picked =
//                        await DatePickerMode.showDatePicker(
//                            context: context,
//                            initialFirstDate: dateFrom,
//                            initialLastDate: dateTo,
//                            firstDate: DateTime(2015),
//                            lastDate: DateTime(2090));
//                        if (picked != null && picked.length == 2) {
//                          setState(() {
//                            updateDates(picked.elementAt(0), picked.elementAt(1));
//                          });
//                        }
                      },
                      child: TextField(
                        controller: dateController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          hintText: 'DATA',
                          hintStyle: TextStyle(
                            color: Colors.white,
//                          fontSize: 15.0,
                            fontFamily: 'Lato',
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: categoryIdController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'KATEGORIA',
                        hintStyle: TextStyle(
                          color: Colors.white,
//                          fontSize: 15.0,
                          fontFamily: 'Lato',
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: amountController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'CENA',
                        hintStyle: TextStyle(
                          color: Colors.white,
//                          fontSize: 15.0,
                          fontFamily: 'Lato',
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'NAZWA',
                        hintStyle: TextStyle(
                          color: Colors.white,
//                          fontSize: 15.0,
                          fontFamily: 'Lato',
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintText: 'OPIS',
                  hintStyle: TextStyle(
                    color: Colors.white,
//                          fontSize: 15.0,
                    fontFamily: 'Lato',
                  ),
                  filled: true,
                  fillColor: Colors.black12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 0.0,
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
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  final double amount = double.parse(amountController.text);
                  NetworkHelper.updateBalance(amount);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBarNavigation(
        currentIndex: ExpenseAddScreen.index,
      ),
    );
  }
}
