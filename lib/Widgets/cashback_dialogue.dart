import 'package:bright_boost/Screens/Home/HomeScreen.dart';
import 'package:bright_boost/constant.dart';
import 'package:bright_boost/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget cashbackDialogue({required String paymentType}) {
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    content: SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ///this is the lottie animation
          Lottie.asset(
            'assets/lottie/celebration2.json',
            // width: width,
          ),

          ///this is portion of powered by and other text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Powered by',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              //space
              const SizedBox(
                height: 5,
              ),

              ///image of powered by
              Container(
                height: 35,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/sua.png',
                    ),
                  ),
                ),
              ),

              //space
              const SizedBox(
                height: 20,
              ),

              //cashback price

              Text(
                paymentType == "term" ? '\$ 2500.00' : '\$ 5000.00',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //space
              const SizedBox(
                height: 10,
              ),

              //got cashback
              const Text(
                'Plan Active',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              //space
              const SizedBox(
                height: 10,
              ),

              //successful message
            ],
          ),
        ],
      ),
    ),
    actions: [
      MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              navigatorKey.currentContext!,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        },
        child: Text(
          "Continue",
          style: TextStyle(color: appColor),
        ),
      )
    ],
  );
}
