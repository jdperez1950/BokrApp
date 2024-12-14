import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/session_utils.dart';
import '/models/user_model.dart';
import '/utils/map_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GlobalController {
  late SharedPreferences prefs;
  final isLoading = false.obs;
  String defaultLocale = Platform.localeName;
  final _user = Rxn<UserModel>();
  final _tokenFcm = ''.obs;
  bool searchNear = true;

  GlobalController() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      SessionUtils.getUser(prefs).then((value) => user = value);
      tokenFcm = prefs.getString(SessionUtils.fcmTokenData) ?? '';
    });
  }

  bool get showProgress => isLoading.value;

  set showProgress(bool value) => isLoading.value = value;

  UserModel? get user => _user.value;

  set user(UserModel? value) {
    prefs.setString(
        SessionUtils.userData, value != null ? jsonEncode(value) : '');
    _user.value = value;
  }

  String get tokenFcm => _tokenFcm.value;

  set tokenFcm(String value) {
    debugPrint('FCM Token: $value');
    prefs.setString(SessionUtils.fcmTokenData, value);
    _tokenFcm.value = value;
  }

  closeSession() {
    prefs.clear();
    user = null;
    // Get.offAllNamed(SplashPage.name, arguments: true);
  }

  manageError(dynamic error) {
    debugPrint(error.toString());
    showProgress = false;
    var title = 'Error';
    var message = 'Ha ocurrido un error de comunicación';
    if (error is ErrorModel) {
      title = error.module ?? 'Error';
      message = error.message ?? 'Ha ocurrido un error de comunicación';
    }
    if (error is Map<String, dynamic>) {
      title = error['title'] ?? 'Error';
      message = error['message'] ?? 'Ha ocurrido un error de comunicación';
    }
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM);
  }

  showError(String title, String message) {
    manageError({'title': title, 'message': message});
  }

  showSuccess(String title, String message) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM);
  }
}
