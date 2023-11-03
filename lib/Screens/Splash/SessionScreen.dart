import 'package:bright_boost/Models/GroupChatModel.dart';
import 'package:bright_boost/Providers/SessionProvider.dart';
import 'package:bright_boost/Screens/Chat/ChatScreen.dart';
import 'package:bright_boost/Widgets/DrawerWidget.dart';
import 'package:bright_boost/Widgets/TextWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import '../../Providers/validation_provider.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SessionProvider>(context, listen: false).mGetChatList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ValidationProvider, SessionProvider>(
      builder: (context, VP, value, child) => SafeArea(
        child: SafeArea(
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
                Container(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
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
                                title: "SESSION",
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
                        StreamBuilder<QuerySnapshot>(
                          stream: value.queryChat,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error.toString());
                              return Text(snapshot.error.toString());
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator());
                            }
                            if (!snapshot.hasData) {
                              return Text('No Data');
                            }
                            value.mupdateCustomer(snapshot.data!.docs
                                .map((e) => GroupChatModel.fromjson(
                                    e.data() as Map<String, dynamic>))
                                .toList());
                            return value.valueProfessor == false
                                ? Center(
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : value.professorsChatsList.isEmpty
                                    ? Text(
                                        "No Chat",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            value.professorsChatsList.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(
                                                                model: value
                                                                        .professorsChatsList[
                                                                    index])));
                                              },
                                              child: ProfessorChatWidget(
                                                  model:
                                                      value.professorsChatsList[
                                                          index]));
                                        });
                          },
                        ),
                      ],
                    ),
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

Widget ProfessorChatWidget({required GroupChatModel model}) {
  return Column(
    children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(model.profImage!),
        ),
        title: Text(
          model.teacherName!,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          model.lastMessage!,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          "${readTimestamp(model.timestamp!)}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      Divider(
        color: Colors.white,
        thickness: 0.5,
      ),
    ],
  );
}
