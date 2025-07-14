import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:url_launcher/url_launcher.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
