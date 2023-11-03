import 'package:bright_boost/Screens/Home/HomeScreen.dart';
import 'package:bright_boost/Screens/Privacy/AboutScreen.dart';
import 'package:bright_boost/Screens/Privacy/PrivacyPolicyScreen.dart';
import 'package:bright_boost/Screens/Splash/SessionScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constant.dart';
import '../Providers/validation_provider.dart';
import '../Screens/Auth/LoginScreen.dart';
import '../Screens/Auth/UpdateProfileScreen.dart';
import 'SharedPrefernce.dart';
import 'TextWidget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, value, child) => Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: appColor,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("${value.loginModel!.imageUrl}"),
              ),
              accountName:
                  TextWidget(title: "${value.loginModel!.name}", size: 16),
              accountEmail:
                  TextWidget(title: "${value.loginModel!.email}", size: 16),
            ),
            _listtileWidget(
                title: "Home",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                }),
            Divider(
              thickness: 1,
            ),
            _listtileWidget(
                title: "Profile",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()));
                }),
            Divider(
              thickness: 1,
            ),
             _listtileWidget(
                title: "Sessions",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SessionScreen()));
                }),
            Divider(
              thickness: 1,
            ),
             _listtileWidget(
                title: "Privacy Policy",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacypolicyScreen()));
                }),
                Divider(
              thickness: 1,
            ),
             _listtileWidget(
                title: "About Us",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutUsScreen()));
                }),
            Divider(
              thickness: 1,
            ),
            _listtileWidget(
                title: "Logout",
                onPressed: () {
                  logout(context);
                }),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _listtileWidget({required String title, dynamic onPressed}) {
  return ListTile(
    title: TextWidget(
        title: "$title",
        size: 18,
        fontWeight: FontWeight.w700,
        color: appColor),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: appColor,
      size: 15,
    ),
    onTap: onPressed,
  );
}

logout(BuildContext context) {
  Widget okButton = ElevatedButton(
    child: Text("Yes"),
    style: ElevatedButton.styleFrom(primary: Colors.red),
    onPressed: () async {
      Shared.pref.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          (route) => false);
    },
  );
  Widget cancelButtion = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.green),
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sure to Logout',
            style: TextStyle(color: appColor, fontWeight: FontWeight.w500),
          ),
          content: Text('Are you sure you want to Logout?'),
          actions: [okButton, cancelButtion],
        );
      });
}
