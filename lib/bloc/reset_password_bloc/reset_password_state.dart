part of 'reset_password_bloc.dart';

// Bloc State
class ResetPasswordState extends Equatable {
  final String email;
  final String newPassword;
  final bool isPasswordVisible;
  final String confirmNewPassword;

  const ResetPasswordState({
    this.email = '',
    this.newPassword = '',
    this.isPasswordVisible = true,
    this.confirmNewPassword = '',
  });

  ResetPasswordState copyWith({
    String? email,
    String? newPassword,
    bool? isPasswordVisible,
    String? confirmNewPassword,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
    );
  }

  @override
  List<Object> get props =>
      [email, newPassword, confirmNewPassword, isPasswordVisible];
}
