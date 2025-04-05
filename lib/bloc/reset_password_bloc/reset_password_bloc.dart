import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

// Reset Password  Bloc Class

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState()) {
    //email change state manage
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });
    //new password change state manage
    on<NewPasswordChange>((event, emit) {
      emit(state.copyWith(
        newPassword: event.newPassword,
      ));
    });
    //confirm new password change state manage
    on<ConfirmPasswordChange>((event, emit) {
      emit(state.copyWith(
        confirmNewPassword: event.confirmNewPassword,
      ));
    });
    //password vidible change state manage
    on<PasswordVisible>((event, emit) {
      emit(state.copyWith(
        isPasswordVisible: event.isPasswordVisible,
      ));
    });
  }
}
