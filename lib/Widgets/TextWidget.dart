import 'package:flutter/material.dart';

Widget TextWidget(
    {required String title,
    required double size,
    FontWeight? fontWeight,
    dynamic maxline,
    dynamic color}) {
  return Text(
    "$title",
    maxLines: maxline,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.white,
    ),
  );
}