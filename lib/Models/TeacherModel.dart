import 'dart:collection';

class TeacherModel {
  String? name;
  String? email;
  String? phoneNo;
  String? imageUrl;
  String? education;
  List<dynamic>? subject;
  String? address;
  String? aboutUs;
  String? status;
  int? timestamp;
  int? lastLogin;
  int? type;

  TeacherModel({
    this.name,
    this.email,
    this.phoneNo,
    this.education,
    this.subject,
    this.address,
    this.timestamp,
    this.imageUrl,
    this.status,
    this.aboutUs,
    this.lastLogin,
    this.type,
  });

  factory TeacherModel.fromjson(Map<String, dynamic> parsedJson) {
    return TeacherModel(
      name: parsedJson["name"],
      email: parsedJson["email"],
      phoneNo: parsedJson["phoneNo"],
      subject: parsedJson["subject"],
      address: parsedJson["address"],
      timestamp: parsedJson["timestamp"],
      education: parsedJson["education"],
      aboutUs: parsedJson["aboutUs"],
      imageUrl: parsedJson["imageUrl"],
      status:parsedJson["status"],
      lastLogin:parsedJson["lastLogin"],

      type:parsedJson["type"],
    );
  }

  Map<String, dynamic> loginToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["name"] = this.name;
    map["email"] = this.email;
    map["address"] = this.address;
    map["subject"] = this.subject;
    map["phoneNo"] = this.phoneNo;
    map["education"] = this.education;
    map["imageUrl"] = this.imageUrl;
    map["timestamp"] = this.timestamp;
    map["aboutUs"] = this.aboutUs;
    map["status"]=this.status;
    map["lastLogin"]=this.lastLogin;
    map["type"]=this.type;
    return map;
  }

  Map<String, dynamic> UpdateToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["name"] = this.name;
    map["address"] = this.address;
    map["phoneNo"] = this.phoneNo;
    map["aboutUs"] = this.aboutUs;
    return map;
  }
}
