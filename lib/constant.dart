import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double height=height;

double width=width;

Color primaryColor = Color.fromARGB(255, 16, 134, 158);
const Color mainThemeColor = Color(0xff0256A6);
Color appColor = Color.fromARGB(255, 3, 59, 70);

String readTimestamp(int timestamp) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String finaldate = DateFormat.jm().format(datetime);
  return finaldate;
}

String checkTimestamp(int timestamp) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String finaldate = DateFormat('yyyy-MM-dd').format(datetime);
  return finaldate;
}


String readTimestampAnswer(int timestamp) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String finaldate = DateFormat.yMd().add_jm().format(datetime);
  return finaldate;
}