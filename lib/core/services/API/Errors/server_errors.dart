import 'error_model.dart';

class ServerErrors implements Exception {
  final ErrorModel errorModel;
  ServerErrors({required this.errorModel});
}
