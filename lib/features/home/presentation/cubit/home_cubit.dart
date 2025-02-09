import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/API/consumers/api_consumer.dart';
import '../../data/user_model.dart';
import '../../domain/user_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiConsumer}) : super(HomeInitial());
  ApiConsumer apiConsumer;

  getUser() async {
    emit(HomeLoading());
    UserRepo userRepo = UserRepo(api: apiConsumer);
    final result = await userRepo.getUser();
    result.fold(
      (user) {
        emit(HomeSuccess(user));
      },
      (error) {
        emit(HomeError(error.errorMessage));
      },
    );
  }
}
