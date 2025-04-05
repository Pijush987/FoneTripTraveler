import 'dart:convert';
import '../../model/model.dart';
import '../storage/local_storage.dart';
import 'package:flutter/material.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool? isLogin;
  static LoginModel user = LoginModel();

  /// Private constructor for creating the singleton instance of [SessionController].
  SessionController._internal() {
    isLogin = false;
  }

  /// Factory constructor for accessing the singleton instance of [SessionController].
  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController.user = LoginModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
