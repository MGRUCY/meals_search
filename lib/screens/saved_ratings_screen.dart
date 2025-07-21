import 'package:flutter/material.dart';
import '../models/meal_rating.dart';
import '../services/meal_storage.dart';

class SavedRatingsScreen extends StatefulWidget {
  const SavedRatingsScreen({super.key});

  @override
  State<SavedRatingsScreen> createState() => _SavedRatingsScreenState();
}

class _SavedRatingsScreenState extends State<SavedRatingsScreen> {
  _loadRatings() async {
    pubg = await MealStorage.loadRatings();
    setState(() {
      
    });
  }

  List<MealRating> pubg = [];
  @override
  void initState() {
    _loadRatings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Saved Ratings')),
        body: ListView.builder(
          itemCount: pubg.length,
          itemBuilder: (context, index) {
            final rating = pubg[index];

            return ListTile(
              title: Text('Meal: ${rating.mealName}'),
              subtitle: Text('Nickname: ${rating.nickname}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (i) {
                  if (rating.rating >= i + 1) {
                    return const Icon(Icons.star, color: Colors.amber);
                  } else if (rating.rating >= i + 0.5) {
                    return const Icon(Icons.star_half, color: Colors.amber);
                  } else {
                    return const Icon(Icons.star_border, color: Colors.amber);
                  }
                }),
              ),
            );
          },
        ));
  }
}
