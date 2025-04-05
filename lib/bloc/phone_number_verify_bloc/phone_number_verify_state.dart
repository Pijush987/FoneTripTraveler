part of 'phone_number_verify_bloc.dart';

// Bloc State
class PhoneNumberVerifyState extends Equatable {
  final String verifyCode;
  final String otp;

  const PhoneNumberVerifyState({
    this.verifyCode = '',
    this.otp = '',
  });

  PhoneNumberVerifyState copyWith({
    String? verifyCode,
    String? otp,
  }) {
    return PhoneNumberVerifyState(
      verifyCode: verifyCode ?? this.verifyCode,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object> get props => [verifyCode, otp];
}
