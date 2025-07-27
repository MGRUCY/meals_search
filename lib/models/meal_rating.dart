class MealRating {
  final String mealId;
  final String nickname;
  final double rating;
  final String mealName;

  MealRating({
    required this.mealId,
    required this.nickname,
    required this.rating,
    required this.mealName,
  });

  Map<String, dynamic> toJson() => {
        'mealId': mealId,
        'nickname': nickname,
        'rating': rating,
        'mealName': mealName,
      };

  factory MealRating.fromJson(Map<String, dynamic> json) => MealRating(
        mealId: json['mealId'],
        nickname: json['nickname'],
        rating: (json['rating'] as num).toDouble(),
        mealName: json['mealName'], 
      );
}
