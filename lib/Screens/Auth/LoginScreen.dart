import 'dart:async';
import 'package:bright_boost/Screens/Auth/RegisterScreen.dart';
import 'package:bright_boost/Screens/Payment/card_screem.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:bright_boost/Screens/Home/HomeScreen.dart';
import '../../Constant.dart';
import '../../Providers/internetConnection.dart';
import '../../Providers/validation_provider.dart';
import '../../Widgets/FlushBarWidget.dart';
import '../../Widgets/TextFormWidget.dart';
import '../../Widgets/TextWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Consumer2<ValidationProvider, internetConnectionProvider>(
      builder: (context, value, internet, child) => Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/background.png",
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            Form(
              key: _formKey,
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Lottie.asset(
                        "assets/lottie/login.json",
                        height: height * 0.3,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        title: "Login",
                        size: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textfieldProduct(
                          context: context,
                          name: "Email",
                          controller: email,
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      textfieldProduct(
                        context: context,
                        name: "Password",
                        controller: password,
                        obscureText: passwordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: width * 0.6,
                        child: RoundedLoadingButton(
                            valueColor: Colors.black,
                            color: Colors.white,
                            controller: buttonController,
                            onPressed: () async {
                              
                                if (_formKey.currentState!.validate()) {
                                  await value.loginUser(
                                      email.text, password.text);
                                  if (value.isUserLoggedIn) {
                                    await value.mGetUser(email.text);
                                    if (value.loginModel!.type == 0) {
                                      if (value.loginModel!.payment == true) {
                                        if (value.loginModel!.status ==
                                            "Approved") {
                                            value.mUpdateLastLogin(email: email.text);
                                          buttonController.success();
                                          SuccessFlushbar(context, "Login",
                                              "${value.userLoginMessage}");
                                          Timer(Duration(seconds: 2), () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                                (route) => false);
                                            buttonController.reset();
                                          });
                                        } else {
                                          buttonController.error();
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    title: Text("Warning"),
                                                    content: Text(
                                                        "You are blocked by admin. For account activation please connect with support team or email at support@brightboost.com. Thank you!"),
                                                    actions: [
                                                      MaterialButton(
                                                        color: appColor,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                          Timer(Duration(seconds: 2), () {
                                            buttonController.reset();
                                          });
                                        }
                                      } else {
                                        buttonController.success();
                                        SuccessFlushbar(context, "Login",
                                            "${value.userLoginMessage}");
                                        Timer(Duration(seconds: 2), () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CardScreen(
                                                        email: email.text,
                                                      )),
                                              (route) => false);
                                          buttonController.reset();
                                        });
                                      }
                                    } else {
                                      buttonController.error();
                                      ErrorFlushbar(context, "Login",
                                          "You are not login as a Student !");
                                      Timer(Duration(seconds: 2), () {
                                        buttonController.reset();
                                      });
                                    }
                                  } else {
                                    buttonController.error();
                                    ErrorFlushbar(context, "Login",
                                        "Please Check Your Email and Password!");
                                    Timer(Duration(seconds: 2), () {
                                      buttonController.reset();
                                    });
                                  }
                                } else {
                                  buttonController.error();
                                  Timer(Duration(seconds: 2), () {
                                    buttonController.reset();
                                  });
                                }
                             
                            },
                            child: TextWidget(
                              title: "Login",
                              size: 14,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: TextWidget(
                              title: "Don't have an account? Sign Up",
                              size: 16,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
