import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/meal.dart';
import '../widgets/nickname_form.dart';
import '../widgets/star_rating.dart';
import '../widgets/save_button.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key, required this.meal});
  final Meal meal;
  
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String nickname = '';
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.thumbnail),
            const SizedBox(height: 10),
            Text("This meal is ${meal.area}",
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(meal.link);
                await launchUrl(url);
              },
              child: Text(meal.link,
                  style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline)),
            ),
            const SizedBox(height: 16),
            NicknameForm(onSaved: (value) {
              setState(() => nickname = value);
            }),
            const SizedBox(height: 10),
            StarRating(
              rating: rating,
              onRatingChanged: (newRating) =>
                  setState(() => rating = newRating),
            ),
            const SizedBox(height: 10),
            SaveButton(nickname: nickname, meal: meal, rating: rating),
          ],
        ),
      ),
    );
  }
}
