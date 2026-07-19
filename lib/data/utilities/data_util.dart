import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopping_list_poc/data/models/ingredient.dart';

import '../models/meal.dart';

class DataUtil {
  Future<List<Meal>> loadMeals() async {
    final String rawJsonString = await rootBundle.loadString(
      'lib/data/raw_data/meals.json',
    );

    List<Ingredient> allIngredients = await loadIngredientsFromJson();

    final List<dynamic> rawJsonMealList = json.decode(rawJsonString);
    List<Meal> meals = [];


    for (final item in rawJsonMealList) {
      String mealName = item['name'];
      List<dynamic> ingredients = item['ingredients'];

      List<Ingredient> mealIngredients = [];
      for (String i in ingredients) {
        mealIngredients.add(getIngredientByName(i, allIngredients));
      }

      meals.add( Meal(name: mealName, ingredients: mealIngredients) );
    }
    return meals;
  }

  Ingredient getIngredientByName(String name, List<Ingredient> ingredients) {
    for (final i in ingredients) {
      if (i.name == name) return i;
    }
    throw Exception('Ingredient ${name} could not be found');
  }

  Future<List<Ingredient>> loadIngredientsFromJson() async {
    final String rawJsonString = await rootBundle.loadString(
      'lib/data/raw_data/ingredients.json',
    );

    final List<dynamic> rawIngredientList = json.decode(rawJsonString);
    return rawIngredientList.map((json) => Ingredient.fromJson(json)).toList();
  }
}
