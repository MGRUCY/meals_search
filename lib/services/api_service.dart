import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class ApiService {
  Future<List<Meal>> searchMeals(String name) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$name'),
    );
    final data = json.decode(response.body);
    return (data['meals'] as List)
      .map((mealJson) => Meal.fromJson(mealJson))
      .toList();
  }
}

