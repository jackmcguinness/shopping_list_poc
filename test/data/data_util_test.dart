import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list_poc/data/models/ingredient.dart';
import 'package:shopping_list_poc/data/models/meal.dart';
import 'package:shopping_list_poc/data/utilities/data_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Loads ingredients json successfully', () async {
    final ingredients = await DataUtil().loadIngredientsFromJson();
    expect(ingredients.isNotEmpty, true);
  });

  test('Populates meals with valid Ingredient objects', () async {
    // when meals are loaded
    List<Meal> meals = await DataUtil().loadMeals();

    // then ingredients should have name and locations populated
    List<Ingredient> ingredients = meals.expand((meal) => meal.ingredients).toList();
    List<String> locations = ingredients.map((ingredient) => ingredient.location).toList();

    // each ingredient only has one location
    expect(ingredients.length, locations.length);
  });
}
