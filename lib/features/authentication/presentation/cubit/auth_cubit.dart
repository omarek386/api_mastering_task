import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/services/API/consumers/api_consumer.dart';
import '../../domain/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.apiConsumer}) : super(AuthInitial());

  final ApiConsumer apiConsumer;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();

  signIn() async {
    emit(AuthSignInLoading());
    final AuthRepo authRepo = AuthRepo(apiConsumer: apiConsumer);
    final response = await authRepo.signIn(email: email.text, pass: pass.text);
    response.fold(
      (success) {
        emit(AuthSignInSuccess(success.message));
      },
      (error) {
        emit(AuthSignInError(error.errorMessage));
      },
    );
  }

  TextEditingController nameup = TextEditingController();
  TextEditingController phoneUp = TextEditingController();
  TextEditingController emailUp = TextEditingController();
  TextEditingController passUp = TextEditingController();
  TextEditingController cPassUp = TextEditingController();

  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  GlobalKey<FormState> fKeyP = GlobalKey<FormState>();
  GlobalKey<FormState> cfKeyP = GlobalKey<FormState>();
  GlobalKey<FormState> fKeyN = GlobalKey<FormState>();
  GlobalKey<FormState> fKeyPh = GlobalKey<FormState>();

  XFile? profilePic;

  pickImage() async {
    emit(AuthSignUpLoading());
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePic = pickedFile;
    }
    emit(AuthSignUpPickImage());
  }

  signUp() async {
    emit(AuthSignUpLoading());

    final AuthRepo authRepo = AuthRepo(apiConsumer: apiConsumer);
    await authRepo
        .signUp(
            name: nameup.text,
            phone: phoneUp.text,
            email: emailUp.text,
            pass: passUp.text,
            cPass: cPassUp.text,
            profilePic: profilePic!)
        .then((response) {
      response.fold(
        (success) {
          emit(AuthSignUpSuccess(success));
        },
        (error) {
          emit(AuthSignUpError(error.errorMessage));
        },
      );
    });
  }
}
