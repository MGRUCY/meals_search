import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MealStorage {
  static Future<void> saveMealData({
    required String mealName,
    required String nickname,
    required double rating,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final data = jsonEncode({
      'nickname': nickname,
      'rating': rating,
    });

    await prefs.setString(mealName, data);
  }

  static Future<Map<String, dynamic>?> getMealData(String mealName) async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString(mealName);

    if (dataString != null) {
      final decoded = jsonDecode(dataString);
      return {
        'nickname': decoded['nickname'],
        'rating': decoded['rating'],
      };
    }

    return null;
  }
}
