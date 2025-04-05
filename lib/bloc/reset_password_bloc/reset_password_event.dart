part of 'reset_password_bloc.dart';

// Bloc Events
abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ResetPasswordEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class NewPasswordChange extends ResetPasswordEvent {
  final String newPassword;
  const NewPasswordChange(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

class ConfirmPasswordChange extends ResetPasswordEvent {
  final String confirmNewPassword;
  const ConfirmPasswordChange(this.confirmNewPassword);

  @override
  List<Object> get props => [confirmNewPassword];
}

class PasswordVisible extends ResetPasswordEvent {
  final bool isPasswordVisible;
  const PasswordVisible(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}
