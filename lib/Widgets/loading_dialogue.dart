import 'package:bright_boost/constant.dart';
import 'package:flutter/material.dart';





Widget loadingDialogue(){
  return WillPopScope(
    onWillPop: () async => false,
    child: AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
      content: const Row(
        children: [
          //circular loading
          SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: mainThemeColor,
            ),
          ),

          //space
          SizedBox(width: 20,),

          //loading text
          Text('Loading....'),
        ],
      ),
    ),
  );
}