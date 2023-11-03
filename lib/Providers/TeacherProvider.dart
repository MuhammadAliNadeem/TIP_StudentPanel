import 'package:bright_boost/Models/TeacherModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;

  List<TeacherModel> teacherModel = [];
  bool valueTeacher = false;
  mGetTeacher() async {
    List<TeacherModel> teacherModel = [];
    await firestore
        .collection("users")
        .where("type", isEqualTo: 1)
        .get()
        .then((value) => value.docs.forEach((element) {
              teacherModel.add(TeacherModel.fromjson(element.data()));
            }));
    this.teacherModel = teacherModel;
    valueTeacher = true;
    notifyListeners();
  }

  List<TeacherModel> teacherModelSubject = [];
  bool valueTeacherSubject = false;
  mGetTeacherSubject() async {
    List<TeacherModel> teacherModelSubject = [];
    await firestore
        .collection("users")
        .where("type", isEqualTo: 1)
        .orderBy("timestamp",descending: true)
        .get()
        .then((value) => value.docs.forEach((element) {
              teacherModelSubject.add(TeacherModel.fromjson(element.data()));
            }));
    this.teacherModelSubject = teacherModelSubject;
    valueTeacherSubject = true;
    notifyListeners();
  }
}
