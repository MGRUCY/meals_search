import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _controller = TextEditingController();
  List<Meal> meals = [];

  void search() async {
    final searchText = _controller.text.trim();
    final result = await ApiService().searchMeals(searchText);
    
    setState(() {
      meals = result;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (_) => search(),
              decoration: InputDecoration(
                hintText: 'Enter a meal name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: search,
                ),
              ),
            ),
            const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return ListTile(
                      leading: Image.network(meal.thumbnail, width: 60),
                      title: Text(meal.name),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: meal,
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
