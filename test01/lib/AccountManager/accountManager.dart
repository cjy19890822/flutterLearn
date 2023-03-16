import 'package:shared_preferences/shared_preferences.dart';

class AccountManager{

  final kLastLoginUsername = "kLastLoginUserName";

  final kLastLoginPassword = "kLastLoginPassword";

  AccountManager._();

  static final shared = AccountManager._();

  static AccountManager? _instance;
  static AccountManager get instance => _instance ??= AccountManager._();

  static void destoryInstance() => _instance = null;


  Future<SharedPreferences> get userDefine async{
    return await SharedPreferences.getInstance();
  }

  Future<bool?> get isFirst async{
    final userDefine = await this.userDefine;
    return userDefine.getBool("isFirst")??true;
  }



   Future<void> setFirst(bool isFirst) async{
      final userDefine = await this.userDefine;
      userDefine.setBool("isFirst", isFirst);
   }

}