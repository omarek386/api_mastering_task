class ErrorModel {
  final String errorMessage;
  final int status;

  ErrorModel({required this.errorMessage, required this.status});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage: json["ErrorMessage"],
      status: json["status"],
    );
  }
}
