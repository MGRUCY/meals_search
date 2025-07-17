import 'package:flutter/material.dart';
import 'package:meals_search_rework/utility/meal_storage.dart';
import 'package:meals_search_rework/utility/nick_name_input.dart';
import '../models/meal.dart';
import 'package:url_launcher/url_launcher.dart';


class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.network(meal.thumbnail)),
            SizedBox(
              height: 10,
            ),
            Text(
              "This meal is ${meal.area}",
              style: const TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Youtube link: "),
            SizedBox(
              height: 2,
            ),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(meal.link);
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child:Text(
                meal.link,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(16), // or EdgeInsets.symmetric / only
              child: const NickNameInput(),
            ), 
            const SizedBox(
              height: 10,
            ),
            
            ElevatedButton(
              onPressed: () async {
                await MealStorage.saveMealData(
                  mealName: 'Chicken Curry',
                  nickname: 'Spicy King',
                  rating: 4.5,
                );
              },
              child: Text('Save Meal'),
            ),
          ],
        ),
      ),
    );
  }
}
