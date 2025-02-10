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

  GlobalKey<FormState> emailUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> passUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> nameUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> cPassUpKey = GlobalKey<FormState>();

  XFile? profilePic;

  Future pickImage() async {
    AuthRepo authRepo = AuthRepo(apiConsumer: apiConsumer);
    emit(AuthSignUpLoading());
    profilePic = await authRepo.addProfilePic();

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
      profilePic: await authRepo.uploadImage(profilePic),
    )
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
