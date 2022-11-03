import 'dart:async';
import 'dart:convert';

import '../models/user_info_model.dart';
import './Network_Utils.dart';
import './URL_Paths.dart';

import '../models/auth_info.dart';
import 'auth_storage.dart';

class AuthenticationAPI {
  NetworkUtil _netUtil = new NetworkUtil();
  final JsonDecoder _decoder = new JsonDecoder();
  String ip = '';

  Future<UserInfoModel> login(
      String email, String password, bool remeberMe) async {
    String url = URLPaths.LOGIN_URL;

    return _netUtil.post(url, headers: {
      "content-type": "application/json",
      "accept": "*/*",
    }, body: {
      'email': email,
      'password': password,
      'rememberMe': remeberMe,
    }).then((dynamic response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        UserInfoModel result =
            new UserInfoModel.fromJson(_decoder.convert(res));

        return result;
      } else if (statusCode == 401) {
        throw new Exception(
            ":البريد الالكتروني او كلمة السر غير صحيحة" + " " + response.body);
      } else if (statusCode == 404) {
        throw new Exception(
            "لا يمكن الوصول للخادم .. الرجاء التأكد من اتصالك بالانترنيت");
      } else if (statusCode == 500) {
        throw new Exception(response.body);
      } else {
        throw new Exception(response.body);
      }
    });
  }

  Future<UserInfoModel> getUserInfofromAPI(String urlPath) async {
    String token = await AuthenticationStorage().readToken();

    final response = await _netUtil.get(
      URLPaths.USERINFO + urlPath,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'bearer $token',
      },
    );

    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return UserInfoModel.fromJson(json.decode(response.body));
    } else if (statusCode == 401) {
      throw new Exception(
          "غير مخول بالدخول .. الرجاء تسجيل الخروج ثم تسجيل الدخول");
    } else if (statusCode == 404) {
      throw new Exception(
          "لا يمكن الوصول للخادم او الرقم المطلوب غير صحيح .. الرجاء التأكد من اتصالك بالانترنيت");
    } else if (statusCode == 500) {
      throw new Exception(
          "حدث خطأ في بيانات السيرفر .. الرجاء المحاولة في وقت اخر");
    } else {
      throw new Exception("حدث خطأ عام .. الرجاء المحاولة في وقت اخر");
    }
  }

  Future<String> checkLogin() async {
    var token = await AuthenticationStorage().readToken();

    final response = await _netUtil.get(
      URLPaths.CHECKLOGIN,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'bearer $token',
      },
    );

    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return "";
    } else if (statusCode == 401) {
      throw new Exception(
          "غير مخول بالدخول .. الرجاء تسجيل الخروج ثم تسجيل الدخول");
    } else if (statusCode == 404) {
      throw new Exception(
          "لا يمكن الوصول للخادم او الرقم المطلوب غير صحيح .. الرجاء التأكد من اتصالك بالانترنيت");
    } else if (statusCode == 500) {
      throw new Exception(
          "حدث خطأ في بيانات السيرفر .. الرجاء المحاولة في وقت اخر");
    } else {
      throw new Exception("حدث خطأ عام .. الرجاء المحاولة في وقت اخر");
    }
  }
}
