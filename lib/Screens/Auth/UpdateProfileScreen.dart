import 'dart:async';
import 'package:bright_boost/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../Constant.dart';
import '../../Providers/internetConnection.dart';
import '../../Providers/validation_provider.dart';
import '../../Widgets/FlushBarWidget.dart';
import '../../Widgets/TextFormWidget.dart';
import '../../Widgets/TextWidget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Consumer2<ValidationProvider, internetConnectionProvider>(
      builder: (context, value, internet, child) => SafeArea(
        child: Scaffold(
          key: _scaffoldState,
          drawer: DrawerWidget(),
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
                            SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  _scaffoldState.currentState!.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                )),
                          ),
                          TextWidget(
                              title: "Profile",
                              size: 20,
                              fontWeight: FontWeight.w400),
                          Opacity(
                            opacity: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.menu,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                          // Stack(
                          //   clipBehavior: Clip.none,
                          //   alignment: Alignment.bottomRight,
                          //   children: [
                          //     ///profile picture
                          //     value.profileFileBytes != null
                          //         ? CircleAvatar(
                          //             radius: 55,
                          //             backgroundColor: const Color(0xffe0e0e0),
                          //             backgroundImage:
                          //                 MemoryImage(value.profileFileBytes),
                          //           )
                          //         : CircleAvatar(
                          //             radius: 55,
                          //             backgroundColor: Colors.white,
                          //             child: Lottie.asset(
                          //               'assets/lottie/dp.json',
                          //             ),
                          //           ),

                          //     ///edit button
                          //     Positioned(
                          //       bottom: 5,
                          //       child: CircleAvatar(
                          //         radius: 13,
                          //         backgroundColor: appColor,
                          //         child: IconButton(
                          //           disabledColor: appColor,
                          //           icon: const Icon(
                          //             Remix.pencil_line,
                          //             size: 12,
                          //             color: Colors.white,
                          //           ),
                          //           onPressed: () {
                          //             showModalBottomSheet<void>(
                          //               backgroundColor: Colors.transparent,
                          //               context: context,
                          //               builder: (BuildContext context) {
                          //                 return dpEditDialogue(

                          //                     ///actions camera, gallery, cancel
                          //                     onTapCamera: () async {
                          //                   Navigator.pop(context);
                          //                   final ImagePicker _picker =
                          //                       ImagePicker();
                          //                   final image =
                          //                       await _picker.pickImage(
                          //                           source: ImageSource.camera);
                          //                   final imageBytes =
                          //                       await image!.readAsBytes();
                          //                   final imagesname = image.name;

                          //                   value.profileFile =
                          //                       File(image.path);
                          //                   await value.muppdateprofileBytes(
                          //                       imagesname,
                          //                       imageBytes,
                          //                       value.profileFile!);
                          //                 }, onTapGallery: () async {
                          //                   Navigator.pop(context);
                          //                   final ImagePicker _picker =
                          //                       ImagePicker();
                          //                   final image =
                          //                       await _picker.pickImage(
                          //                           source:
                          //                               ImageSource.gallery);
                          //                   final imageBytes =
                          //                       await image!.readAsBytes();
                          //                   final imagesname = image.name;

                          //                   value.profileFile =
                          //                       File(image.path);
                          //                   await value.muppdateprofileBytes(
                          //                       imagesname,
                          //                       imageBytes,
                          //                       value.profileFile!);
                          //                 }, onTapCancel: () {
                          //                   Navigator.pop(context);
                          //                 });
                          //               },
                          //             );
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          textfieldProduct(
                              context: context,
                              name: "Name",
                              controller: value.name,
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
                              controller: value.email,
                              isread:true,
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
                              controller: value.phoneNo,
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
                              controller: value.education,
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
                              controller: value.address,
                              suffixIcon: const Icon(
                                Icons.location_city,
                                color: Colors.white,
                              )),
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
                                      await value.mUpdateProfile();
                                      buttonController.success();
                                      SuccessFlushbar(context, "Update Profile", "Your change have been saved.");
                                      Timer(Duration(seconds: 2), () { 
                                      buttonController.reset();
                                      Navigator.pop(context);
                                      });
                                    } else {
                                      buttonController.error();
                                      Timer(Duration(seconds: 2), () {
                                        buttonController.reset();
                                      });
                                    }
                                
                                },
                                child: TextWidget(
                                  title: "Update Profile",
                                  size: 14,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
