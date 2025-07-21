import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class ApiService {
  static Future<List<Meal>> searchMeals(String query) async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['meals'] == null) return [];
      return (jsonData['meals'] as List)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
