class Ingredient {
  String name;
  String location;

  Ingredient({required this.name, required this.location});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        name: json['name'],
        location: json['location']
    );
  }


  @override
  String toString()
  {
    return '${name}:${location}';
  }
}