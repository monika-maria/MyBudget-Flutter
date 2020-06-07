import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybudget/components/floating_action_button.dart';
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
  List<DropdownMenuItem<Category>> dropdownMenuItems;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    NetworkHelper.getCategories().then((categoriesFromServer) {
      setState(() {
        categories = categoriesFromServer;
        dropdownMenuItems = buildDropdownMenuItems(categories);
      });
    });
  }

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category c in categories) {
      items.add(DropdownMenuItem(
        value: c,
        child: Text(c.name),
      ));
    }
    return items;
  }

  DateTime date = DateTime.now();
  String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Category _category;
  Color _color = Colors.white;

  void updateDate(DateTime _date) {
    dateString = DateFormat('yyyy-MM-dd').format(_date);
  }

  void updateCategory(int _categoryId) {
    _category = categories
        .where((element) => element.categoryId == _categoryId)
        .toList()[0];
//    _color = Color(int.parse(_category.color.replaceAll('#', '0xFF')));
  }

  onChangeDropdownItem(Category category) {
    setState(() {
      _category = category;
      _color = Color(int.parse(_category.color.replaceAll('#', '0xFF')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Dodaj rachunek',
            style: kAppBarTextStyle,
          ),
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
                        final DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2090));
                        if (picked != null) {
                          setState(() {
                            updateDate(picked);
                          });
                        }
                      },
                      child: Container(
//                        margin: EdgeInsets.all(15.0),
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
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
                              '$dateString',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
//                        margin: EdgeInsets.all(15.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.category,
                            color: _color,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton(
                            hint: Text(
                              'KATEGORIA',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Lato',
                              ),
                            ),
                            value: _category,
                            items: dropdownMenuItems,
                            onChanged: onChangeDropdownItem,
//                            dropdownColor: kPrimaryColor,
                            dropdownColor: Color(0xFF660066),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white, //Color(0xFF660066),
                              fontFamily: 'Lato',
                            ),
                          ),
                        ],
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
//      floatingActionButton: getFloatingActionButton(context),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarNavigation(
        currentIndex: ExpenseAddScreen.index,
      ),
    );
  }
}
