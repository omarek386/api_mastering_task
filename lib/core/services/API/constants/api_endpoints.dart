import '../../Database/cache_helper.dart';
import 'api_keys.dart';

class ApiEndpoints {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String signIn = 'user/signin';
  static const String signUp = 'user/signup';
  static const String checkEmail = 'user/check-email';
  static const String updateUser = 'user/update';
  static const String deleteUser = 'user/delete';
  static String getUserData =
      'user/get-user/${CacheHelper.getData(key: ApiKeys.id)}';
  static const String userLogout = 'user/logout';
}
