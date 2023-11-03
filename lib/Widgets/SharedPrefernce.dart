import 'package:shared_preferences/shared_preferences.dart';
class Shared {
   static SharedPreferences pref =
      SharedPreferences.getInstance() as SharedPreferences;
}