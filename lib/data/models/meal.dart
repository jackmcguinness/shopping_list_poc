class Meal {
  final String name;
  final List<String> ingredients;

  Meal({required this.name, required this.ingredients});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      ingredients: List<String>.from(json['ingredients'])
    );
  }

  @override
  String toString()
  {
    return '${name}: ${ingredients.toString()}';
  }
}