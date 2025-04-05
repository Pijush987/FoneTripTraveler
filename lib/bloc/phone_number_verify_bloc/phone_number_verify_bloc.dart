import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_number_verify_event.dart';
part 'phone_number_verify_state.dart';

// Phone Number Verify  Bloc Class

class PhoneNumberVerifyBloc
    extends Bloc<PhoneNumberVerifyEvent, PhoneNumberVerifyState> {
  PhoneNumberVerifyBloc() : super(const PhoneNumberVerifyState()) {
    //verifycation code change state manage
    on<VerificationCodeCheck>((event, emit) {
      emit(state.copyWith(
        verifyCode: event.verifyCode,
      ));
    });
    //otp code change state manage
    on<OtpCodeChange>((event, emit) {
      emit(state.copyWith(
        otp: event.otp,
      ));
    });
  }
}
