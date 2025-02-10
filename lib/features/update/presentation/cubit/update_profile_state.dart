part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {}

final class UpdateProfileError extends UpdateProfileState {
  final String errorMessage;

  UpdateProfileError(this.errorMessage);
}

final class UpdateProfilePicSuccess extends UpdateProfileState {
  UpdateProfilePicSuccess();
}
