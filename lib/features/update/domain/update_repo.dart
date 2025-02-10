// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mastering_task/core/services/API/consumers/api_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/services/API/Errors/error_model.dart';
import '../../../core/services/API/Errors/server_errors.dart';
import '../../../core/services/API/constants/api_endpoints.dart';
import '../../../core/services/API/constants/api_keys.dart';
import '../../../core/services/API/functions/upload_image_to_api.dart';

class UpdateRepo {
  ApiConsumer apiConsumer;
  UpdateRepo({
    required this.apiConsumer,
  });
  Future<Either<String, ErrorModel>> updateProfile(
      {required String name,
      required String phone,
      required profilePic}) async {
    try {
      final response = await apiConsumer.patch(
        ApiEndpoints.updateUser,
        isFormData: true,
        data: {
          ApiKeys.name: name,
          ApiKeys.phone: phone,
          ApiKeys.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys.profilePic: profilePic,
        },
      );
      return Left(response['message']);
    } on ServerErrors catch (e) {
      return Right(e.errorModel);
    } catch (e) {
      return Right(ErrorModel(errorMessage: e.toString(), status: 400));
    }
  }

  Future<XFile?> updateProfilePic() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future uploadImage(XFile? imageFile) async {
    if (imageFile != null) {
      return await uploadImageToAPI(imageFile);
    } else {
      return null;
    }
  }
}
