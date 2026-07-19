import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list_poc/data/models/ingredient.dart';
import 'package:shopping_list_poc/data/models/meal.dart';
import 'package:shopping_list_poc/logic/shopping_list_builder.dart';

final Ingredient testIngredient1 = Ingredient(name: 'testIng', location: 'testIsle',);
final Ingredient testIngredient2 = Ingredient(name: 'testing2', location: 'testIsle',);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Adds unique ingredients to list correctly', () {

    List<Meal> meals = [];
    meals.add(
      Meal(name: 'Test', ingredients: [testIngredient1, testIngredient2]),
    );

    final shoppingList = ShoppingListBuilder().buildShoppingList(meals);

    Map<Ingredient, int> expected = Map.of({
      testIngredient1: 1,
      testIngredient2: 1,
    });

    expect(shoppingList.itemsAndQuantity, expected);
  });

  test('Increments multiple ingredients in multiple meals correctly', () {

    List<Meal> meals = [];
    meals.add(Meal(name: 'Meal1', ingredients: [testIngredient1, testIngredient2]));
    meals.add(Meal(name: 'Meal2', ingredients: [testIngredient1, testIngredient2]));
    meals.add(Meal(name: 'Meal3', ingredients: [testIngredient1]));

    final shoppingList = ShoppingListBuilder().buildShoppingList(meals);

    Map<Ingredient, int> expected = Map.of({
      testIngredient1: 3,
      testIngredient2: 2,
    });

    expect(shoppingList.itemsAndQuantity, expected);
  });


}
