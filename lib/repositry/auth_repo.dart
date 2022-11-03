import '../api/auth_api.dart';
import '../api/auth_storage.dart';
import '../models/auth_info.dart';
import '../models/user_info_model.dart';

class AuthRepo {
  final api = AuthenticationAPI();

  Future<UserInfoModel> login(
      String email, String password, bool remeberMe) async {
    return api.login(email, password, remeberMe);
  }

  void storeToken(UserInfoModel user) async {
    AuthenticationStorage store = new AuthenticationStorage();
    store.removeToken();
    store.storeToken(user.accessToken!);
  }

  // Future<UserInfoModel> getUserInfo(
  //     {required DateTime fromDate, required DateTime toDate}) {
  //   String urlPath = '';
  //   if (fromDate != null) urlPath += '?from=${fromDate.toIso8601String()}';
  //   if (toDate != null)
  //     urlPath +=
  //         '${fromDate != null ? '&' : '?'}to=${toDate.toIso8601String()}';

  //   return api.getUserInfofromAPI(urlPath);
  // }

  Future<String> checkIfLoggedIn() {
    return api.checkLogin();
  }
}
