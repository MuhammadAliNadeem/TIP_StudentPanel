import 'dart:async';
import 'dart:io';
import 'package:bright_boost/Screens/Auth/LoginScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../Constant.dart';
import '../../Providers/internetConnection.dart';
import '../../Providers/validation_provider.dart';
import '../../Widgets/FlushBarWidget.dart';
import '../../Widgets/TextFormWidget.dart';
import '../../Widgets/TextWidget.dart';
import '../../Widgets/dp_edit_dialogue.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Consumer2<ValidationProvider, internetConnectionProvider>(
      builder: (context, value, internet, child) => SafeArea(
        child: Scaffold(
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
                child: SizedBox(
                  height: height,
                  width: width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          // Lottie.asset(
                          //   "assets/lottie/register.json",
                          //   height: height * 0.3,
                          // ),
                          TextWidget(
                            title: "Sign Up",
                            size: 24,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomRight,
                            children: [
                              ///profile picture
                              value.profileFileBytes != null
                                  ? CircleAvatar(
                                      radius: 55,
                                      backgroundColor: const Color(0xffe0e0e0),
                                      backgroundImage:
                                          MemoryImage(value.profileFileBytes),
                                    )
                                  : CircleAvatar(
                                      radius: 55,
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.person_2_outlined,size: 100,),
                                    ),
                              ///edit button
                              Positioned(
                                bottom: 5,
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: appColor,
                                  child: IconButton(
                                    disabledColor: appColor,
                                    icon: const Icon(
                                      Remix.pencil_line,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return dpEditDialogue(

                                              ///actions camera, gallery, cancel
                                              onTapCamera: () async {
                                            Navigator.pop(context);
                                            final ImagePicker _picker =
                                                ImagePicker();
                                            final image =
                                                await _picker.pickImage(
                                                    source: ImageSource.camera);
                                            final imageBytes =
                                                await image!.readAsBytes();
                                            final imagesname = image.name;

                                            value.profileFile =
                                                File(image.path);
                                            await value.muppdateprofileBytes(
                                                imagesname,
                                                imageBytes,
                                                value.profileFile!);
                                          }, onTapGallery: () async {
                                            Navigator.pop(context);
                                            final ImagePicker _picker =
                                                ImagePicker();
                                            final image =
                                                await _picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            final imageBytes =
                                                await image!.readAsBytes();
                                            final imagesname = image.name;

                                            value.profileFile =
                                                File(image.path);
                                            await value.muppdateprofileBytes(
                                                imagesname,
                                                imageBytes,
                                                value.profileFile!);
                                          }, onTapCancel: () {
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                          
                            ],
                          ),

                          textfieldProduct(
                              context: context,
                              name: "Name",
                              controller: name,
                              suffixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          textfieldProduct(
                              context: context,
                              name: "Email",
                              controller: email,
                              suffixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          textfieldProduct(
                              context: context,
                              name: "Phone No",
                              controller: phoneNo,
                              suffixIcon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          textfieldProduct(
                              context: context,
                              name: "Education",
                              controller: education,
                              suffixIcon: const Icon(
                                Icons.cast_for_education,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          textfieldProduct(
                              context: context,
                              name: "Address",
                              controller: address,
                              suffixIcon: const Icon(
                                Icons.location_city,
                                color: Colors.white,
                              )),
                          const SizedBox(
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
                          const SizedBox(
                            height: 20,
                          ),
                          textfieldProduct(
                            context: context,
                            name: "Confirm Password",
                            controller: confirmPassword,
                            obscureText: confirmPasswordVisible,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  confirmPasswordVisible =
                                      !confirmPasswordVisible;
                                });
                              },
                              icon: Icon(
                                confirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                                      if (value.profileFileBytes != null) {
                                        if (password.text ==
                                            confirmPassword.text) {
                                          await value.createUser(
                                            email: email.text,
                                            name: name.text,
                                            phone: phoneNo.text,
                                            education: education.text,
                                            address: address.text,
                                            password: password.text,
                                          );
                                          if (value.isUserCreated) {
                                            await value.mGetUser(email.text);
                                            buttonController.success();
                                            SuccessFlushbar(context, "Register",
                                                "${value.userRegisterationMessage}");
                                            Timer(Duration(seconds: 2), () {
                                              buttonController.reset();
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                  (route) => false);
                                              buttonController.reset();
                                            });
                                          } else {
                                            buttonController.error();
                                            SuccessFlushbar(context, "Register",
                                                "${value.userRegisterationMessage}");
                                            Timer(Duration(seconds: 2), () {
                                              buttonController.reset();
                                            });
                                          }
                                        } else {
                                          buttonController.error();
                                          ErrorFlushbar(context, "Subject",
                                              "Subject add first !");
                                          Timer(Duration(seconds: 2), () {
                                            buttonController.reset();
                                          });
                                        }
                                      } else {
                                        buttonController.error();
                                        ErrorFlushbar(context, "Image",
                                            "Image add first !");
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
                                  title: "Sign Up",
                                  size: 14,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: TextWidget(
                                  title: "Already have an account? Login",
                                  size: 16,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
