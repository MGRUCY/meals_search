import 'package:flutter/material.dart';
import 'package:meals_search_rework/screens/saved_ratings_screen.dart';
import '../models/meal.dart';
import '../services/api_service.dart';
import 'meal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meal> meals = [];
  final TextEditingController _controller = TextEditingController();

  void _search() async {
    final result = await ApiService.searchMeals(_controller.text.trim());
    setState(() => meals = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Meals')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Search by name'),
            onSubmitted: (_) => _search(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _search, child: const Text('Search')),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedRatingsScreen(),
                ),
              );
            },
            child: const Text('View Saved Ratings'),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  title: Text(meal.name),
                  leading: Image.network(meal.thumbnail),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MealScreen(meal: meal),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
