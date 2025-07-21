import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final void Function(double) onRatingChanged;

  const StarRating({super.key, required this.rating, required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        IconData icon;
        if (rating >= starValue) {
          icon = Icons.star;
        } else if (rating >= starValue - 0.5) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }

        return GestureDetector(
          onTap: () => onRatingChanged(starValue),
          onDoubleTap: () => onRatingChanged(starValue - 0.5),
          child: Icon(icon, color: Colors.amber, size: 32),
        );
      }),
    );
  }
}
