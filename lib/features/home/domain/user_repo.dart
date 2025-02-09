// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/services/API/Errors/error_model.dart';
import '../../../core/services/API/Errors/server_errors.dart';
import '../../../core/services/API/constants/api_endpoints.dart';
import '../../../core/services/API/consumers/api_consumer.dart';
import '../data/user_model.dart';

class UserRepo {
  ApiConsumer api;
  UserRepo({
    required this.api,
  });
  Future<Either<UserModel, ErrorModel>> getUser() async {
    log('getUser in UserRepo');
    try {
      final response = await api.get(ApiEndpoints.getUserData);
      UserModel user = UserModel.fromJson(response);

      return Left(user);
    } on ServerErrors catch (e) {
      return Right(e.errorModel);
    }
  }
}
