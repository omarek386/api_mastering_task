import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile imageFile) async {
  return MultipartFile.fromFile(
    imageFile.path,
    filename: imageFile.path.split('/').last,
  );
}
