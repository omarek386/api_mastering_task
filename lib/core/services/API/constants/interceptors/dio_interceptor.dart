import 'package:dio/dio.dart';
import '../../../Database/cache_helper.dart';
import '../api_keys.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers.addAll({
      ApiKeys.token: 'FOODAPI ${CacheHelper.getData(key: ApiKeys.token)}',
    });
  }
}
