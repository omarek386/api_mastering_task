import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../core/services/API/Errors/error_model.dart';
import '../../../core/services/API/Errors/server_errors.dart';
import '../../../core/services/API/constants/api_endpoints.dart';
import '../../../core/services/API/constants/api_keys.dart';
import '../../../core/services/API/consumers/api_consumer.dart';
import '../../../core/services/Database/cache_helper.dart';
import '../data/sign_in_model.dart';

class AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepo({required this.apiConsumer});
  Future<Either<SignInModel, ErrorModel>> signIn(
      {required String email, required String pass}) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.signIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: pass,
        },
      );
      SignInModel data = SignInModel.fromJson(response);
      await CacheHelper.saveData(key: ApiKeys.token, value: data.token);
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(data.token);
      await CacheHelper.saveData(
          key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      return Left(data);
    } on ServerErrors catch (e) {
      return Right(e.errorModel);
    }
  }

  Future<Either<String, ErrorModel>> signUp(
      {required String name,
      required String phone,
      required String email,
      required String pass,
      required String cPass,
      required XFile profilePic}) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.signUp,
        isFormData: true,
        data: {
          ApiKeys.name: name,
          ApiKeys.phone: phone,
          ApiKeys.email: email,
          ApiKeys.password: pass,
          ApiKeys.confirmPassword: cPass,
          ApiKeys.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys.profilePic: profilePic,
        },
      );
      return Left(response['message']);
    } on ServerErrors catch (e) {
      return Right(e.errorModel);
    }
  }
}
