import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../Models/UserModel.dart';
import '../Widgets/SharedPrefernce.dart';

class ValidationProvider with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  bool isUserCreated = false;
  String userRegisterationMessage = "";
  bool isUserLoggedIn = false;
  String userLoginMessage = "";

  Future<void> createUser({
    required String email,
    required String name,
    required String phone,
    required String education,
    required String address,
    required String password,
  }) async {
    DocumentReference reference = await firestore.collection("user").doc();
    String id = reference.id;
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final uploadingImage = await FirebaseStorage.instance
          .ref("Profile Images/${id}.png")
          .putData(profileFileBytes)
          .onError((error, stackTrace) {
        throw error!;
      });
      String url = await uploadingImage.ref.getDownloadURL();
      LoginModel model = LoginModel(
        name: name,
        email: email,
        phoneNo: phone,
        imageUrl: url,
        type: 0,
        address: address,
        education: education,
        status: "Approved",
        timestamp: DateTime.now().millisecondsSinceEpoch,
        lastLogin: DateTime.now().millisecondsSinceEpoch,
        paymentTime: null,
        payment: null,
        bankName: null,
        accountNo: null,
        accountHolderName: null,
        cvc: null,
        expireDate: null,
        paymentType: null,
      );

      await firestore.collection("users").doc(email).set(model.loginToMap());
      isUserCreated = true;
      userRegisterationMessage = "Sign up Successfull";
      mClearProfile();
      notifyListeners();
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        userRegisterationMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        userRegisterationMessage = "The account already exists for that email.";
      }
      isUserCreated = false;
      notifyListeners();
    } catch (e) {
      isUserCreated = false;
      userRegisterationMessage = "Something went wrong";
      notifyListeners();
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Shared.pref.setString("email", email);
      isUserLoggedIn = true;
      userLoginMessage = "Welcome.! Sign in Successfull";
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        userLoginMessage = "No user found for that email..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        userLoginMessage = "Wrong password provided for that user..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else {
        userLoginMessage = "Something went wrong..!";
        isUserLoggedIn = false;
        notifyListeners();
      }
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController address = TextEditingController();
  LoginModel? loginModel;
  mGetUser(String email12) async {
    LoginModel? loginModel;
    await firestore
        .collection("users")
        .doc(email12)
        .get()
        .then((value) => loginModel = LoginModel.fromjson(value.data()!));
    this.loginModel = loginModel;
    if (loginModel != null) {
      name = TextEditingController(text: loginModel!.name);
      email = TextEditingController(text: loginModel!.email);
      phoneNo = TextEditingController(text: loginModel!.phoneNo);
      address = TextEditingController(text: loginModel!.address);
      education = TextEditingController(text: loginModel!.education);
    }
    notifyListeners();
  }

  mUpdatePayment({
    required String bankName,
    required String accountHolderName,
    required String accountNo,
    required String cvc,
    required String expireDate,
    required String paymentType,
  }) async {
    LoginModel model = LoginModel(
        paymentTime: DateTime.now().millisecondsSinceEpoch,
        payment: true,
        bankName: bankName,
        accountNo: accountNo,
        accountHolderName: accountHolderName,
        cvc: cvc,
        expireDate: expireDate,
        paymentType: paymentType);
    await firestore
        .collection("users")
        .doc(loginModel!.email)
        .update(model.UpdatePaymentToMap());
    Shared.pref.setString("email", loginModel!.email!);
    await mGetUser(loginModel!.email!);
    notifyListeners();
  }

  String? profileFileName;
  var profileFileBytes;
  File? profileFile;
  muppdateprofileBytes(
      String profileFileName, var profileFileBytes, File profileFile) {
    this.profileFileName = profileFileName;
    this.profileFileBytes = profileFileBytes;
    this.profileFile = profileFile;
    notifyListeners();
  }

  mClearProfile() {
    profileFileName = null;
    profileFileBytes = null;
    profileFile = null;
  }

  bool paymentDialogue = false;
  mUpdatePaymentDialogue({required bool paymentDialogue}) {
    this.paymentDialogue = paymentDialogue;
    notifyListeners();
  }

  mUpdateProfile() async {
    LoginModel model = LoginModel(
      name: name.text,
      phoneNo: phoneNo.text,
      address: address.text,
      education: education.text,
    );
    await firestore
        .collection("users")
        .doc(loginModel!.email)
        .update(model.UpdateprofileToMap());
    await mGetUser(loginModel!.email!);
    notifyListeners();
  }

    mUpdateLastLogin({required String email}) async {
    await firestore
        .collection("users")
        .doc(email)
        .update({"lastLogin": DateTime.now().millisecondsSinceEpoch});
    notifyListeners();
  }
}
