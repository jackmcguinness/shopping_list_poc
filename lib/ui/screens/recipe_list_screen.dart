import 'package:flutter/material.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Plan Screen')),
    );
  }
}
