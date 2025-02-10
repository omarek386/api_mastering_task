import '../../../../core/services/API/constants/api_keys.dart';
import '../../../../core/services/API/consumers/api_consumer.dart';
import '../../../../core/services/Database/cache_helper.dart';
import '../../domain/update_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.apiConsumer})
      : super(UpdateProfileInitial());
  ApiConsumer apiConsumer;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> nameKye = GlobalKey<FormState>();
  GlobalKey<FormState> phoneKye = GlobalKey<FormState>();

  Future updateProfile() async {
    emit(UpdateProfileLoading());
    final UpdateRepo updateRepo = UpdateRepo(
      apiConsumer: apiConsumer,
    );
    final response = await updateRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      profilePic: await updateRepo.uploadImage(imageFile),
    );
    response.fold(
      (success) {
        emit(UpdateProfileSuccess());
      },
      (error) {
        emit(UpdateProfileError(error.errorMessage));
      },
    );
  }

  XFile? imageFile;
  String? profilePic = CacheHelper.getData(key: ApiKeys.profilePic);

  Future updateProfilePic() async {
    final UpdateRepo updateRepo = UpdateRepo(
      apiConsumer: apiConsumer,
    );
    final response = await updateRepo.updateProfilePic();
    response == null ? imageFile = null : imageFile = response;
    emit(UpdateProfilePicSuccess());
  }
}
