import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class SessionUtils {
  //Prefs
  static String userData = 'user_data';
  static String fcmTokenData = 'fcm_token_data';
  static String tokenData = 'token_data';

  static Future<UserModel?> getUser(SharedPreferences prefs) async {
    UserModel? mUser;
    String sData = (prefs.getString(SessionUtils.userData) ?? '');
    debugPrint(sData);
    try {
      Map<String, dynamic> mJson = jsonDecode(sData);
      mUser = UserModel.fromJson(mJson);
    } catch (e) {
      print("Error sessionUtils: $e");
    }
    return mUser;
  }
}
