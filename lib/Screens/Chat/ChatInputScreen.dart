
import 'package:flutter/material.dart';

import '../../Constant.dart';

class ChatInputField extends StatelessWidget {
  final dynamic message;
  final void Function()? press;
  // String receiverId;
  ChatInputField({
    Key? key,
    required this.message,
    required this.press,
    // required this.receiverId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: 15.0,
        vertical: 20.0 / 2,
      ),
      decoration: BoxDecoration(
        // color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                // padding: EdgeInsets.symmetric(
                //   horizontal: 20.0 * 0.01,
                // ),
                decoration: BoxDecoration(
                  color: appColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.keyboard,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: 20.0 / 4),
                    Expanded(
                      child: TextField(
                        controller: message,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        hidekeyboard(context);
                      },
                      icon: Icon(Icons.attachment),
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 2),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              height: 47,
              width: 47,
              decoration: BoxDecoration(
                color: appColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: press,
                  icon: Icon(Icons.send_sharp, color: appColor)),
            ),
          ),
        ],
      ),
    );
  }
  hidekeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}