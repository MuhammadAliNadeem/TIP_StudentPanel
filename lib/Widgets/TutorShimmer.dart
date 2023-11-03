import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

Widget TutorShimmer() {
  return Shimmer(
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0XFFe0e0e0),
          radius: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 15,
          width: 50,
          color: Color(0XFFe0e0e0),
        ),
      ],
    ),
  );
}
