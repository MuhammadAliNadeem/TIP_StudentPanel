import 'dart:async';
import 'package:flutter/material.dart';
import '../../Constant.dart';
import '../Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mupdatea();
  }

  mupdatea() async {
    // String? email = Shared.pref.getString("email");
    // if (email != null) {
    //   ValidationProvider provider =
    //       Provider.of<ValidationProvider>(context, listen: false);
    //   await provider.mGetUser(email);
    //   if (provider.loginModel!.role == "Delivery Boy") {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => DeliveryPickUpScreen()));
    //   } else if (provider.loginModel!.role == "Pickup Boy") {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => PickupPendingScreen()));
    //   }else  {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => ReturnPendingScreen()));
    //   }
    // } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    // }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/splash_bg.png",
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              "assets/bb.png",
              height: height * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}
