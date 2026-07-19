import 'package:flutter/foundation.dart';
import 'package:shopping_list_poc/data/models/ingredient.dart';

class ShoppingList {
  Map<Ingredient, int> itemsAndQuantity = {};

  ShoppingList();

  void add(Ingredient ingredient) {
    itemsAndQuantity[ingredient] = (itemsAndQuantity[ingredient] ?? 0 ) + 1;
  }

  @override
  String toString() {
    return itemsAndQuantity.toString();
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingList &&
        mapEquals(itemsAndQuantity, other.itemsAndQuantity);
  }

  @override
  int get hashCode => itemsAndQuantity.hashCode;
}
