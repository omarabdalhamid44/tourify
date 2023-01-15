import 'package:shared_preferences/shared_preferences.dart';
class SharedPref{
  late final SharedPreferences _prefernces;
  static final  SharedPref _instance = SharedPref._internal();
  factory SharedPref(){
    return _instance;
  }

  Future<void> initalizationPrefernces() async{
    _prefernces = await SharedPreferences.getInstance();
  }
  SharedPref._internal(){
    initalizationPrefernces();
  }

  SharedPreferences get pref{
    return _prefernces;
  }




}