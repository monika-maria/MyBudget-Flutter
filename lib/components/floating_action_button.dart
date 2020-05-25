import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/screens/expense_add_screen.dart';
import 'package:mybudget/constants.dart';

FloatingActionButton getFloatingActionButton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed(context, ExpenseAddScreen.id);
    },
    child: Icon(
      FontAwesomeIcons.plus, //t,
      size: 30.0,
    ),
    backgroundColor: kSecondaryColor,
    elevation: 6,
  );
}
