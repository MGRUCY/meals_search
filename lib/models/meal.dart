class Meal {
  final String id;
  final String name;
  final String thumbnail;
  final String area;
  final String link;


  Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.area,
    required this.link,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      area: json['strArea'],
      link: json['strYoutube'],
    );
  }
}
