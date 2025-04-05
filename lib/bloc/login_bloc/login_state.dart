part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String phoneNo;
  final String password;
  final String countryCode;
  final String message;
  final bool isRememberPassword;
  final bool isEmailFieldEmpty;
  final bool isPhoneFieldEmpty;
  final bool isPasswordFieldEmpty;
  final PostApiStatus postApiStatus;

  const LoginState({
    this.email = '',
    this.message = '',
    this.phoneNo = '',
    this.password = '',
    this.countryCode = '+91',
    this.isRememberPassword = false,
    this.isEmailFieldEmpty = false,
    this.isPhoneFieldEmpty = false,
    this.isPasswordFieldEmpty = false,
    this.postApiStatus = PostApiStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? message,
    String? phoneNo,
    String? password,
    String? countryCode,
    bool? isRememberPassword,
    bool? isEmailFieldEmpty,
    bool? isPhoneFieldEmpty,
    bool? isPasswordFieldEmpty,
    PostApiStatus? postApiStatus,
  }) {
    return LoginState(
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        password: password ?? this.password,
        countryCode: countryCode ?? this.countryCode,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus,
        isEmailFieldEmpty: isEmailFieldEmpty ?? this.isEmailFieldEmpty,
        isPhoneFieldEmpty: isPhoneFieldEmpty ?? this.isPhoneFieldEmpty,
        isPasswordFieldEmpty: isPasswordFieldEmpty ?? this.isPasswordFieldEmpty,
        isRememberPassword: isRememberPassword ?? this.isRememberPassword);
  }

  @override
  List<Object> get props => [
        message,
        postApiStatus,
        email,
        phoneNo,
        password,
        countryCode,
        isEmailFieldEmpty,
        isPhoneFieldEmpty,
        isPasswordFieldEmpty,
        isRememberPassword
      ];
}
