import 'package:bright_boost/Models/AnswerModel.dart';
import 'package:bright_boost/Models/GroupChatModel.dart';
import 'package:bright_boost/Providers/SessionProvider.dart';
import 'package:bright_boost/Screens/Chat/ChatInputScreen.dart';
import 'package:bright_boost/Widgets/TextWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import '../../Providers/validation_provider.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.model});
  final GroupChatModel model;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SessionProvider>(context, listen: false)
        .mGetAnswer(id: widget.model.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ValidationProvider, SessionProvider>(
      builder: (context, VP, value, child) => SafeArea(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              backgroundColor: appColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.model.profImage!),
                  ),
                  TextWidget(
                    title: "  ${widget.model.teacherName!}",
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.67,
                          width: width,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: value.AnswerStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasError)
                                  return Text(snapshot.error.toString());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox(
                                      // height: MediaQuery.of(context).size.height,
                                      // width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child:
                                                  CircularProgressIndicator())));
                                }
                                if (!snapshot.hasData) return Text('No Data');
                                value.allAnswer = snapshot.data!.docs
                                    .map((e) => AnswerModel.fromJson(
                                        e.data() as Map<String, dynamic>))
                                    .toList();
                                return value.allAnswer.length == 0
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                            child: Text(
                                          "No Chat",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      )
                                    : ListView.builder(
                                        itemCount: value.allAnswer.length,
                                        // shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        reverse: true,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () async {},
                                            child: Column(
                                                crossAxisAlignment: VP
                                                            .loginModel!
                                                            .email ==
                                                        value.allAnswer[index]
                                                            .email
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                      title: VP.loginModel!
                                                                  .email ==
                                                              value
                                                                  .allAnswer[
                                                                      index]
                                                                  .email
                                                          ? "Me  "
                                                          : "${value.allAnswer[index].name}",
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 7),
                                                    decoration: BoxDecoration(
                                                        color: VP.loginModel!
                                                                    .email ==
                                                                value
                                                                    .allAnswer[
                                                                        index]
                                                                    .email
                                                            ? Colors.grey
                                                            : primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Text(
                                                      "${value.allAnswer[index].message}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${readTimestampAnswer(value.allAnswer[index].timestamp!)}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ]),
                                          );
                                        });
                              }),
                        ),
                      ),
                      // Spacer(),

                      ChatInputField(
                          message: message,
                          press: () async {
                            DateTime currentTime = DateTime.now();

                            // Define the time range (3:00 pm to 5:00 pm)
                            DateTime startTime = DateTime(currentTime.year,
                                currentTime.month, currentTime.day, 15, 30);
                            DateTime endTime = DateTime(currentTime.year,
                                currentTime.month, currentTime.day, 17, 30);

                            // Check if the current time is within the specified range
                            if (currentTime.isAfter(startTime) &&
                                currentTime.isBefore(endTime)) {
                              // Run your function here
                              await value.mAddAnswer(
                                  questionid: widget.model.id!,
                                  message: message.text,
                                  context: context);
                            } else {
                              print(currentTime.isAfter(startTime));
                              print(currentTime.isBefore(endTime));
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Warning"),
                                        content: Text(
                                            "You will be send message between 3:30 pm to 5:30 pm only. Thank you!"),
                                        actions: [
                                          MaterialButton(
                                            color: appColor,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ));
                            }

                            setState(() {});
                            message.clear();
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String readTimestampAnswer(int timestamp) {
  DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String finaldate = DateFormat.yMd().add_jm().format(datetime);
  return finaldate;
}
