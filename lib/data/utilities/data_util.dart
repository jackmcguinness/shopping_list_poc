import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/meal.dart';

class DataUtil {

  Future<List<Meal>> loadMeals() async {

    final String rawJsonString = await rootBundle.loadString('lib/data/raw_data/meals.json');
    final List<dynamic> rawJsonList = json.decode(rawJsonString);

    return rawJsonList
      .map((json) => Meal.fromJson(json))
      .toList();
  }
}