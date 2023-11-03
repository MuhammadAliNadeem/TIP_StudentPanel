import 'package:bright_boost/Providers/SessionProvider.dart';
import 'package:bright_boost/Providers/TeacherProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/internetConnection.dart';
import 'Providers/validation_provider.dart';
import 'Screens/Splash/SplashScreen.dart';
import 'Widgets/SharedPrefernce.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyB1Jqtgn5NikGl1CDhNgZgB3CgR4Yi9K_g",
      authDomain: "bright-boost-fb1cd.firebaseapp.com",
      projectId: "bright-boost-fb1cd",
      storageBucket: "bright-boost-fb1cd.appspot.com",
      messagingSenderId: "1070033038129",
      appId: "1:1070033038129:web:25848629901f0f90079e10",
      measurementId: "G-B1N8TX9198",
    ));
  }
  Shared.pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ValidationProvider>(
              create: (context) => ValidationProvider()),
          ChangeNotifierProvider<internetConnectionProvider>(
              create: (context) => internetConnectionProvider()),
          ChangeNotifierProvider<TeacherProvider>(
              create: (context) => TeacherProvider()),
          ChangeNotifierProvider<SessionProvider>(
              create: (context) => SessionProvider()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Bright Boost',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ) //CardScreen(email: "atif@gmail.com",)),
        );
  }
}
