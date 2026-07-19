import 'package:shopping_list_poc/logic/shopping_list.dart';
import '../data/models/meal.dart';

class ShoppingListBuilder {

  ShoppingList buildShoppingList(List<Meal> meals) {
    ShoppingList shoppingList = ShoppingList();

    for (final meal in meals) {
      for (final ingredient in meal.ingredients) {
        shoppingList.add(ingredient);
      }
    }

    return shoppingList;
  }

}