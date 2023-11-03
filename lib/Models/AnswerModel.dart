import 'dart:collection';

class AnswerModel {
  String? email;
  String? name;
  String? id;
  String? questionid;
  String? message;
  int? timestamp;

  AnswerModel({
    this.email,
    this.id,
    this.name,
    this.message,
    this.questionid,
    this.timestamp,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> parsedJson) {
    return AnswerModel(
      email: parsedJson["email"],
      id: parsedJson["id"],
      name: parsedJson["name"],
      questionid: parsedJson["questionid"],
      timestamp: parsedJson["timestamp"],
      message: parsedJson["message"],
    );
  }

  Map<String, dynamic> AnswerToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["email"] = this.email;
    map["id"] = this.id;
    map["name"] = this.name;
    map["questionid"] = this.questionid;
    map["timestamp"] = this.timestamp;
    map["message"] = this.message;
    return map;
  }
}
