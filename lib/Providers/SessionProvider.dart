import 'package:bright_boost/Models/AnswerModel.dart';
import 'package:bright_boost/Models/TeacherModel.dart';
import 'package:bright_boost/Models/UserModel.dart';
import 'package:bright_boost/Providers/validation_provider.dart';
import 'package:bright_boost/Widgets/SharedPrefernce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/GroupChatModel.dart';

class SessionProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  mSetSession(
      {required TeacherModel teacherModel,
      required BuildContext context}) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference =
        await firestore.collection("professors").doc();
    String id = reference.id;
    // LoginModel? loginModel =
    //     Provider.of<ValidationProvider>(context, listen: false).loginModel;
    GroupChatModel model = GroupChatModel(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      lastMessage: "Start Chat",
      teacherEmail: teacherModel.email,
      studentList: [email],
      id: id,
      profImage: "${teacherModel.imageUrl}",
      teacherName: teacherModel.name,
    );
    await firestore.collection("professors").doc(id).set(model.UpdateChat());
    notifyListeners();
  }

  List<GroupChatModel> professorChatModel = [];
  mCheckChat({required String teacherEmail}) async {
    List<GroupChatModel>? professorChatModel = [];
    await firestore
        .collection("professors")
        .where("teacherEmail", isEqualTo: teacherEmail)
        .get()
        .then((value) => value.docs.forEach((element) {
              professorChatModel.add(GroupChatModel.fromjson(element.data()));
            }));
    this.professorChatModel = professorChatModel;
    notifyListeners();
  }

  mUpdateGroupChat() async {
    String? email = Shared.pref.getString("email");

    List<dynamic> users = [email];
    await firestore
        .collection("professors")
        .doc(professorChatModel[0].id)
        .update({"data": FieldValue.arrayUnion(users)});
    notifyListeners();
  }

  List<GroupChatModel> professorsChatsList = [];
  Stream<QuerySnapshot>? queryChat;
  bool valueProfessor = false;
  mupdateCustomer(List<GroupChatModel> professorsChatsList) {
    this.professorsChatsList = professorsChatsList;
    notifyListeners();
  }

  mGetChatList() async {
    String? email = Shared.pref.getString("email");
    queryChat = await firestore
        .collection("professors")
        .where("studentList", arrayContains: email)
        .snapshots();
    valueProfessor = true;

    notifyListeners();
  }

  Stream<QuerySnapshot>? AnswerStream;
  List<AnswerModel> allAnswer = [];
  mGetAnswer({required String id}) async {
    AnswerStream = await firestore
        .collection("professors")
        .doc(id)
        .collection("Answer")
        .orderBy("timestamp", descending: true)
        .snapshots();
    notifyListeners();
  }

  mAddAnswer(
      {required String questionid,
      required String message,
      required BuildContext context}) async {
    LoginModel? loginModel =
        Provider.of<ValidationProvider>(context, listen: false).loginModel;
    DocumentReference reference = await firestore.collection("Answer").doc();
    String id = reference.id;
    AnswerModel answerModel = AnswerModel(
      email: loginModel!.email,
      id: id,
      name: loginModel.name,
      questionid: questionid,
      message: message,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore
        .collection("professors")
        .doc(questionid)
        .collection("Answer")
        .doc(id)
        .set(answerModel.AnswerToMap());
    await firestore.collection("professors").doc(questionid).update({
      "lastMessage": message,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    });
    notifyListeners();
  }
}
