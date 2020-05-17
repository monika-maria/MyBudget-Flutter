import 'package:http/http.dart' as http;
import 'package:mybudget/models/SumCategory.dart';
import 'package:mybudget/models/Statistics.dart';
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

  //Pobieranie statystyk do Kategorii
  static Future<List<SumCategory>> getCategories() async {
    try {
      final response = await http.get(
          '$url/statistics/sumCategory?dateFrom=2020-01-01&dateTo=2020-05-30');
      if (response.statusCode == 200) {
        print('200');
        List<SumCategory> list =
            parseCategories(utf8.decode(response.bodyBytes));
        return list;
      } else {
        print('else');
        throw Exception("Failed to load Categories");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<SumCategory> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SumCategory>((json) => SumCategory.fromJson(json))
        .toList();
  }
}
