part of 'signup_bloc.dart';

// Bloc Events
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SignupEvent {
  final String text;
  const TextChanged(this.text);

  @override
  List<Object> get props => [text];
}

class PhoneNoChanged extends SignupEvent {
  final String phoneNo;
  const PhoneNoChanged(this.phoneNo);

  @override
  List<Object> get props => [phoneNo];
}

class EmailChanged extends SignupEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignupEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class CountryCodeChange extends SignupEvent {
  final String countryCode;
  const CountryCodeChange(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

class EmptyFieldEmail extends SignupEvent {
  final bool isEmailFieldEmpty;
  const EmptyFieldEmail(this.isEmailFieldEmpty);

  @override
  List<Object> get props => [isEmailFieldEmpty];
}

class EmptyFieldPassword extends SignupEvent {
  final bool isPasswordFieldEmpty;
  const EmptyFieldPassword(this.isPasswordFieldEmpty);

  @override
  List<Object> get props => [isPasswordFieldEmpty];
}

class EmptyFieldPhone extends SignupEvent {
  final bool isPhoneFieldEmpty;
  const EmptyFieldPhone(this.isPhoneFieldEmpty);

  @override
  List<Object> get props => [isPhoneFieldEmpty];
}

class EmptyFieldName extends SignupEvent {
  final bool isNameFieldEmpty;
  const EmptyFieldName(this.isNameFieldEmpty);

  @override
  List<Object> get props => [isNameFieldEmpty];
}
