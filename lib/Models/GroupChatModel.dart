import 'dart:collection';

class GroupChatModel {
  int? timestamp;
  String? lastMessage;
  String? teacherEmail;
  String? teacherName;
  List<dynamic>? studentList;
  String? id;
  String? profImage;

  GroupChatModel({
    this.teacherEmail,
    this.studentList,
    this.id,
    this.lastMessage,
    this.timestamp,
    this.profImage,
    this.teacherName,
  });

  factory GroupChatModel.fromjson(Map<String, dynamic> parsedJson) {
    return GroupChatModel(
      teacherEmail: parsedJson["teacherEmail"],
      studentList: parsedJson["studentList"],
      id: parsedJson["id"],
      lastMessage: parsedJson["lastMessage"],
      timestamp: parsedJson["timestamp"],
      profImage: parsedJson["profImage"],
      teacherName: parsedJson["teacherName"],
    );
  }

  Map<String, dynamic> UpdateChat() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["studentList"] = studentList;
    map["teacherEmail"] = teacherEmail;
    map["id"] = id;
    map["lastMessage"] = lastMessage;
    map["timestamp"] = timestamp;
    map["profImage"] = profImage;
    map["teacherName"] = teacherName;
    return map;
  }
}
