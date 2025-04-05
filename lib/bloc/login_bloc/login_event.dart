part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneNoChanged extends LoginEvent {
  final String phoneNo;
  const LoginPhoneNoChanged(this.phoneNo);

  @override
  List<Object> get props => [phoneNo];
}

class LoginEmailChanged extends LoginEvent {
  final String email;
  const LoginEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginCountryCodeChange extends LoginEvent {
  final String countryCode;
  const LoginCountryCodeChange(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

class RememberPassword extends LoginEvent {
  final bool isRememberPassword;
  const RememberPassword(this.isRememberPassword);

  @override
  List<Object> get props => [isRememberPassword];
}

class EmptyFieldEmail extends LoginEvent {
  final bool isEmailFieldEmpty;
  const EmptyFieldEmail(this.isEmailFieldEmpty);

  @override
  List<Object> get props => [isEmailFieldEmpty];
}

class EmptyFieldPassword extends LoginEvent {
  final bool isPasswordFieldEmpty;
  const EmptyFieldPassword(this.isPasswordFieldEmpty);

  @override
  List<Object> get props => [isPasswordFieldEmpty];
}

class EmptyFieldPhone extends LoginEvent {
  final bool isPhoneFieldEmpty;
  const EmptyFieldPhone(this.isPhoneFieldEmpty);

  @override
  List<Object> get props => [isPhoneFieldEmpty];
}

class VerificationCodeCheck extends LoginEvent {
  final String verifyCode;
  const VerificationCodeCheck(this.verifyCode);

  @override
  List<Object> get props => [verifyCode];
}

class Login extends LoginEvent {}
