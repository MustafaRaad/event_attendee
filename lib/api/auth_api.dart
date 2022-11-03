import 'dart:async';
import 'dart:convert';

import '../models/user_info_model.dart';
import './Network_Utils.dart';
import './URL_Paths.dart';

import 'auth_storage.dart';

class AuthenticationAPI {
  final NetworkUtil _netUtil = NetworkUtil();
  final JsonDecoder _decoder = const JsonDecoder();
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
        UserInfoModel result = UserInfoModel.fromJson(_decoder.convert(res));

        return result;
      } else if (statusCode == 401) {
        throw Exception(
            ":البريد الالكتروني او كلمة السر غير صحيحة" " " + response.body);
      } else if (statusCode == 404) {
        throw Exception(
            "لا يمكن الوصول للخادم .. الرجاء التأكد من اتصالك بالانترنيت");
      } else if (statusCode == 500) {
        throw Exception(response.body);
      } else {
        throw Exception(response.body);
      }
    });
  }

  // Future<UserInfoModel> getUserInfofromAPI(String urlPath) async {
  //   String token = await AuthenticationStorage().readToken();

  //   // final response = await _netUtil.get(
  //   URLPaths.USERINFO + urlPath,
  //   headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'authorization': 'bearer $token',
  //   },
  // );

  //   final int statusCode = response.statusCode;

  //   if (statusCode == 200) {
  //     return UserInfoModel.fromJson(json.decode(response.body));
  //   } else if (statusCode == 401) {
  //     throw Exception(
  //         "غير مخول بالدخول .. الرجاء تسجيل الخروج ثم تسجيل الدخول");
  //   } else if (statusCode == 404) {
  //     throw Exception(
  //         "لا يمكن الوصول للخادم او الرقم المطلوب غير صحيح .. الرجاء التأكد من اتصالك بالانترنيت");
  //   } else if (statusCode == 500) {
  //     throw Exception(
  //         "حدث خطأ في بيانات السيرفر .. الرجاء المحاولة في وقت اخر");
  //   } else {
  //     throw Exception("حدث خطأ عام .. الرجاء المحاولة في وقت اخر");
  //   }
  // }

  Future<String> checkLogin() async {
    var token = await AuthenticationStorage().readToken();

    final response = await _netUtil.get(
      URLPaths.BASE_URL,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'bearer $token',
      },
    );

    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return "";
    } else if (statusCode == 401) {
      throw Exception(
          "غير مخول بالدخول .. الرجاء تسجيل الخروج ثم تسجيل الدخول");
    } else if (statusCode == 404) {
      throw Exception(
          "لا يمكن الوصول للخادم او الرقم المطلوب غير صحيح .. الرجاء التأكد من اتصالك بالانترنيت");
    } else if (statusCode == 500) {
      throw Exception(
          "حدث خطأ في بيانات السيرفر .. الرجاء المحاولة في وقت اخر");
    } else {
      throw Exception("حدث خطأ عام .. الرجاء المحاولة في وقت اخر");
    }
  }
}
