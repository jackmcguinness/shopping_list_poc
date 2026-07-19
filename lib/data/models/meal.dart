import 'package:shopping_list_poc/data/models/ingredient.dart';

class Meal {
  final String name;
  final List<Ingredient> ingredients;

  Meal({required this.name, required this.ingredients});

  @override
  String toString()
  {
    return '${name}: ${ingredients.toString()}';
  }
}