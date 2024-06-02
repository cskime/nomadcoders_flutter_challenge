import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/common/rating_star.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
    required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    final stars = List.generate(
      5,
      (index) => RatingStar(size: 14, filled: rating / 2 > index),
    );
    final spaces = List.generate(
      4,
      (index) => const SizedBox(width: 8),
    );

    var children = <Widget>[stars.first];
    for (int index = 0; index < spaces.length; index++) {
      children.addAll([spaces[index], stars[index + 1]]);
    }

    return Row(children: children);
  }
}
