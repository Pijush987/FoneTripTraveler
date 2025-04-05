part of 'phone_number_verify_bloc.dart';

// Bloc Events
abstract class PhoneNumberVerifyEvent extends Equatable {
  const PhoneNumberVerifyEvent();

  @override
  List<Object> get props => [];
}

class VerificationCodeCheck extends PhoneNumberVerifyEvent {
  final String verifyCode;
  const VerificationCodeCheck(this.verifyCode);

  @override
  List<Object> get props => [verifyCode];
}

class OtpCodeChange extends PhoneNumberVerifyEvent {
  final String otp;
  const OtpCodeChange(this.otp);

  @override
  List<Object> get props => [otp];
}
