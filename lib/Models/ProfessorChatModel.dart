import 'dart:collection';

class ProfessorChatModel {
  int? timestamp;
  String? lastMessage;
  String? teacherEmail;
  String? studentEmail;
  String? teacherName;
  String? studentName;
  String? id;
  String? profImage;
  String? stuImage;

  ProfessorChatModel({
    this.teacherEmail,
    this.studentEmail,
    this.id,
    this.lastMessage,
    this.timestamp,
    this.profImage,
    this.teacherName,
    this.studentName,
    this.stuImage,
  });

  factory ProfessorChatModel.fromjson(Map<String, dynamic> parsedJson) {
    return ProfessorChatModel(
      teacherEmail: parsedJson["teacherEmail"],
      studentEmail: parsedJson["studentEmail"],
      id: parsedJson["id"],
      lastMessage: parsedJson["lastMessage"],
      timestamp: parsedJson["timestamp"],
      profImage: parsedJson["profImage"],
      teacherName: parsedJson["teacherName"],
      studentName: parsedJson["studentName"],
      stuImage:parsedJson["stuImage"]
    );
  }

  Map<String, dynamic> UpdateChat() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["studentEmail"] = studentEmail;
    map["teacherEmail"] = teacherEmail;
    map["id"] = id;
    map["lastMessage"] = lastMessage;
    map["timestamp"] = timestamp;
    map["profImage"] = profImage;
    map["teacherName"] = teacherName;
    map["studentName"] = studentName;
    map["stuImage"]=stuImage;
    return map;
  }
}
