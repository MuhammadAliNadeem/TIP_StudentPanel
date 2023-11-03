// ignore: file_names
import 'dart:collection';

class LoginModel {
  String? name;
  String? email;
  String? phoneNo;
  String? imageUrl;
  String? education;
  String? address;
  String? status;
  int? type;
  int? timestamp;
  int? lastLogin;
  int? paymentTime;
  bool? payment;
  String? paymentType;
  String? bankName;
  String? accountNo;
  String? accountHolderName;
  String? cvc;
  String? expireDate;

  LoginModel({
    this.name,
    this.email,
    this.phoneNo,
    this.education,
    this.type,
    this.address,
    this.timestamp,
    this.imageUrl,
    this.status,
    this.lastLogin,
    this.paymentTime,
    this.payment,
    this.bankName,
    this.accountNo,
    this.accountHolderName,
    this.cvc,
    this.expireDate,
    this.paymentType,
  });

  factory LoginModel.fromjson(Map<String, dynamic> parsedJson) {
    return LoginModel(
      name: parsedJson["name"],
      email: parsedJson["email"],
      phoneNo: parsedJson["phoneNo"],
      type: parsedJson["type"],
      address: parsedJson["address"],
      timestamp: parsedJson["timestamp"],
      education: parsedJson["education"],
      imageUrl: parsedJson["imageUrl"],
      status: parsedJson["status"],
      lastLogin: parsedJson["lastLogin"],
      paymentTime: parsedJson["paymentTime"],
      payment: parsedJson["payment"],
      bankName: parsedJson["bankName"],
      accountNo: parsedJson["accountNo"],
      accountHolderName: parsedJson["accountHolderName"],
      cvc: parsedJson["cvc"],
      expireDate: parsedJson["expireDate"],
      paymentType:parsedJson["paymentType"],
    );
  }

  Map<String, dynamic> loginToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["name"] = name;
    map["email"] = email;
    map["address"] = address;
    map["type"] = type;
    map["phoneNo"] = phoneNo;
    map["education"] = education;
    map["imageUrl"] = imageUrl;
    map["timestamp"] = timestamp;
    map["status"] = status;
    map["lastLogin"] = lastLogin;
    map["paymentTime"] = paymentTime;
    map["payment"] = payment;
    map["bankName"] = bankName;
    map["accountNo"] = accountNo;
    map["accountHolderName"] = accountHolderName;
    map["cvc"] = cvc;
    map["expireDate"] = expireDate;
    map["paymentType"]=paymentType;
    return map;
  }

  Map<String, dynamic> UpdatePaymentToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["paymentTime"] = paymentTime;
    map["payment"] = payment;
    map["bankName"] = bankName;
    map["accountNo"] = accountNo;
    map["accountHolderName"] = accountHolderName;
    map["cvc"] = cvc;
    map["expireDate"] = expireDate;
    map["paymentType"]=paymentType;
    return map;
  }


    Map<String, dynamic> UpdateprofileToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["name"] = name;
    map["address"] = address;
    map["phoneNo"] = phoneNo;
    map["education"] = education;
    return map;
  }
}
