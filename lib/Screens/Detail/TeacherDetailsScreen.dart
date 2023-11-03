import 'package:bright_boost/Models/TeacherModel.dart';
import 'package:bright_boost/Providers/SessionProvider.dart';
import 'package:bright_boost/Providers/TeacherProvider.dart';
import 'package:bright_boost/Screens/Chat/ChatScreen.dart';
import 'package:bright_boost/Widgets/TextWidget.dart';
import 'package:bright_boost/Widgets/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import '../../Providers/validation_provider.dart';

class DetailScreenTeacher extends StatefulWidget {
  DetailScreenTeacher({super.key, required this.model});
  final TeacherModel model;
  @override
  State<DetailScreenTeacher> createState() => _DetailScreenTeacherState();
}

class _DetailScreenTeacherState extends State<DetailScreenTeacher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ValidationProvider, TeacherProvider, SessionProvider>(
      builder: (context, value, TP, SP, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/background.png",
                height: height,
                width: width,
                fit: BoxFit.fill,
              ),
              Container(
                height: height,
                width: width,
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.3,
                            color: Color(0XFFe0e0e0),
                            child: Image.network(
                              widget.model.imageUrl!,
                              width: width,
                              height: height * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: CircleAvatar(
                              backgroundColor: appColor,
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back))),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextWidget(title: widget.model.name!, size: 20),
                            TextWidget(
                              title: widget.model.email!,
                              size: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              // height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Qualification  :  ${widget.model.education}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              // height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Phone No  :  ${widget.model.phoneNo}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              // height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Address  :  ${widget.model.address}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextWidget(title: "Subjects : ", size: 20),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              runSpacing: 13,
                              spacing: 13,
                              children: List.generate(
                                widget.model.subject!.length,
                                (index) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  // height: 35,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "${widget.model.subject![index]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextWidget(title: "About Us : ", size: 20),
                            SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              title: widget.model.aboutUs!,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () async {
              showDialog(
                  context: context, builder: (context) => loadingDialogue());
              await SP.mCheckChat(teacherEmail: widget.model.email!);
              if (SP.professorChatModel.isNotEmpty) {
                SP.mUpdateGroupChat();
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(model: SP.professorChatModel[0])));
              } else {
                await SP.mSetSession(
                    teacherModel: widget.model, context: context);
              await SP.mCheckChat(teacherEmail: widget.model.email!);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(model: SP.professorChatModel[0])));
              }
            },
            child: Container(
              width: width,
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: primaryColor),
              child: TextWidget(
                  title: "Session with ${widget.model.name}",
                  size: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
