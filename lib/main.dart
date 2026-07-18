import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App MVP',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MealPlanScreen(),
    );
  }
}
