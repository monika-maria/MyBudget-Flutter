//import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mybudget/models/Category.dart';
import 'package:mybudget/models/Expense.dart';
import 'package:mybudget/models/SumCategory.dart';
import 'package:mybudget/models/Statistics.dart';
import 'package:mybudget/models/Account.dart';
import 'dart:convert';

import 'package:mybudget/models/User.dart';

String url = 'http://tm.monikamaria.usermd.net/mybudget/api';
String emanresu = "qC53@bG*^";
String drowssap = "45DFdd&@!b#S";
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$emanresu:$drowssap'));
//final _auth = FirebaseAuth.instance;
//FirebaseUser loggedInUser;

//void getCurrentUser() async {
//  try {
//    final user = await _auth.currentUser();
//    if (user != null) {
//      loggedInUser = user;
//      print('loggedInUser');
//      print(loggedInUser);
//    }
//  } catch (e) {
//    print(e);
//  }
//}

class NetworkHelper {
  //Pobieranie statystyk
  static Future<Statistics> getStatistics(
      String dateFrom, String dateTo) async {
    try {
      final response = await http.get(
        '$url/statistics?dateFrom=$dateFrom&dateTo=$dateTo',
        /*headers: {'authorization': basicAuth}*/
      );
      if (response.statusCode == 200) {
        List<Statistics> list =
            parseStatistics(utf8.decode(response.bodyBytes));
        print('Zapytanie POSZLO');
        print(dateFrom);
        print(dateTo);
        return list[0];
      } else {
        throw Exception("!!!Failed to load Statistics");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Statistics> parseStatistics(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Statistics>((json) => Statistics.fromJson(json)).toList();
  }

  //Pobieranie wydatków
  static Future<List<Expense>> getExpenses(
      String dateFrom, String dateTo) async {
    try {
      final response = await http.get(
          '$url/expenses?dateFrom=$dateFrom&dateTo=$dateTo',
          headers: {'authorization': basicAuth});
      if (response.statusCode == 200) {
        print('200');
        List<Expense> list = parseExpenses(utf8.decode(response.bodyBytes));
        return list;
      } else {
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Expense> parseExpenses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Expense>((json) => Expense.fromJson(json)).toList();
  }

  //Pobieranie konta
  static Future<Account> getAccount() async {
    try {
      final response =
          await http.get('$url/account', headers: {'authorization': basicAuth});
      if (response.statusCode == 200) {
        List<Account> list = parseAccount(utf8.decode(response.bodyBytes));
        return list[0];
      } else {
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Account> parseAccount(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Account>((json) => Account.fromJson(json)).toList();
  }

  //Aktualizowanie stanu konta
  static Future<void> updateBalance(double amount) async {
    try {
      final response = await http.post('$url/account', headers: {
        'authorization': basicAuth
      }, body: {
        "balance": amount,
        "userId": 1,
      });
      if (response.statusCode == 201) {
        final String responseString = response.body;
        //return responseString;
      } else {
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Pobieranie kategorii
  static Future<List<Category>> getCategories() async {
    try {
      final response = await http
          .get('$url/categories', headers: {'authorization': basicAuth});
      if (response.statusCode == 200) {
        print('200');
        List<Category> list = parseCategories(utf8.decode(response.bodyBytes));
        return list;
      } else {
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Category> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  //Dodawanie uzytkownika
  static Future<void> createUser(String username, String password) async {
    try {
      final response = await http.post('$url/user', headers: {
        'authorization': basicAuth
      }, body: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 201) {
        final String responseString = response.body;
        //return responseString;
      } else {
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
