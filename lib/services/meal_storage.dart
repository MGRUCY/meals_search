import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal_rating.dart';

class MealStorage {
  static const String key = 'meal_ratings';

  static Future<void> saveRating(MealRating mr) async {
    final prefs = await SharedPreferences.getInstance();
    final ratings = prefs.getStringList(key) ?? [];

    ratings.add(jsonEncode(mr.toJson()));
    await prefs.setStringList(key, ratings);
  }

  static Future<List<MealRating>> loadRatings() async {
    final prefs = await SharedPreferences.getInstance();
    final ratings = prefs.getStringList(key) ?? [];
    return ratings.map((s) => MealRating.fromJson(jsonDecode(s))).toList();
  }

  static clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
