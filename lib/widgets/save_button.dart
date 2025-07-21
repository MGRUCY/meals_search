import 'package:flutter/material.dart';
import '../models/meal.dart'; 
import '../models/meal_rating.dart'; 
import '../services/meal_storage.dart';

class SaveButton extends StatelessWidget {
  final String nickname;
  final Meal meal;
  final double rating;

  const SaveButton({
    super.key,
    required this.nickname,
    required this.meal,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Save pubg'),
      onPressed: () async {
        final ratingData = MealRating(
          mealId: meal.id,
          mealName: meal.name,
          nickname: nickname,
          rating: rating,
        );
        

        await MealStorage.saveRating(ratingData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rating saved!')),
        );
      },
    );
  }
}
