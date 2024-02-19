import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EdspertRatingStar {
  Widget primary(String rating) {
    return RatingBar.builder(
      initialRating: double.parse(rating),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 10,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (double value) {},
    );
  }
}