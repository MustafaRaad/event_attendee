import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/auth_info.dart';
import '../models/profile_model.dart';

class AuthenticationStorage {
  storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = prefs.getString('token');
    if (str != null) {
      await prefs.remove('token');
    }
  }

  Future<String> readToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = prefs.getString('token');
    if (str != null) {
      return str;
    }

    return '';
  }

  void setUserInfomation(ProfileModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', json.encode(data));
  }

  Future<ProfileModel?> getUserInfomation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = prefs.getString('user');
    if (str != null) {
      var decode = json.decode(str);
      var data = ProfileModel.fromJson(decode);
      return data;
    }
    return null;
  }
}
