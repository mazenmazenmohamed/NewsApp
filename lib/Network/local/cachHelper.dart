import 'package:shared_preferences/shared_preferences.dart';
class cachHelper{
  static late SharedPreferences sh;
  static init() async{
     sh=await SharedPreferences.getInstance() ;
  }
  static Future<bool> putBool({required String key , required bool val})async{
     return await sh.setBool(key, val);
  }
  static  getBool({ required String key}){
    return  sh.getBool(key);
  }

}