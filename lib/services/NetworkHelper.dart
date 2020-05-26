import 'package:http/http.dart' as http;
import 'package:mybudget/models/Category.dart';
import 'package:mybudget/models/Expense.dart';
import 'package:mybudget/models/SumCategory.dart';
import 'package:mybudget/models/Statistics.dart';
import 'package:mybudget/models/Account.dart';
import 'dart:convert';

String url = 'http://tm.monikamaria.usermd.net/mybudget/api';

class NetworkHelper {
  //Pobieranie statystyk
  static Future<Statistics> getStatistics() async {
    try {
      final response = await http
          .get('$url/statistics?dateFrom=2020-01-01&dateTo=2020-05-30');
      if (response.statusCode == 200) {
        List<Statistics> list =
            parseStatistics(utf8.decode(response.bodyBytes));
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
  static Future<List<Expense>> getExpenses() async {
    try {
      final response =
          await http.get('$url/expenses?dateFrom=2020-01-01&dateTo=2020-05-30');
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
      final response = await http.get('$url/account');
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
      final response = await http.post('$url/account', body: {
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
      final response = await http.get('$url/categories');
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
}
