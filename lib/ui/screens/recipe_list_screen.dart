import 'package:flutter/material.dart';
import 'package:shopping_list_poc/data/models/meal.dart';

import '../../data/utilities/data_util.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  List<Meal> allMeals = [];
  List<Meal> selectedMeals = [];

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  Future<void> loadMeals() async {
    final List<Meal> mealsFromJson = await DataUtil().loadMeals();

    setState(() {
      allMeals = mealsFromJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Plan Screen')),
      body: ListView.builder(
        itemCount: allMeals.length, //number of recipes in meals.json
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(allMeals[index].name),
            value: selectedMeals.contains(allMeals[index]),
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  selectedMeals.add(allMeals[index]);
                } else {
                  selectedMeals.remove(allMeals[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: Center(
        child: ElevatedButton(
          onPressed: () {
            //todo: process selected meals and print ingredients
            print(selectedMeals);
          },
          child: const Text('Give me my shopping list'),
        ),
      ),
    );
  }
}
