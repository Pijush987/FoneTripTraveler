import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

// Signup Bloc Class

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    //user name change state manage
    on<TextChanged>((event, emit) {
      emit(state.copyWith(
        text: event.text,
      ));
    });
    //email change state manage
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });
    //phone number change state manage
    on<PhoneNoChanged>((event, emit) {
      emit(state.copyWith(
        phoneNo: event.phoneNo,
      ));
    });
    //password change state manage
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });
    //country code change state manage
    on<CountryCodeChange>((event, emit) {
      emit(state.copyWith(
        countryCode: event.countryCode,
      ));
    });
    //Email Empty Field value change state manage
    on<EmptyFieldEmail>((event, emit) {
      emit(state.copyWith(
        isEmailFieldEmpty: event.isEmailFieldEmpty,
      ));
    });
    //Passowrd Empty Field value change state manage
    on<EmptyFieldPassword>((event, emit) {
      emit(state.copyWith(
        isPasswordFieldEmpty: event.isPasswordFieldEmpty,
      ));
    });
    //Phone Empty Field value change state manage
    on<EmptyFieldPhone>((event, emit) {
      emit(state.copyWith(
        isPhoneFieldEmpty: event.isPhoneFieldEmpty,
      ));
    });
    //Name Empty Field value change state manage
    on<EmptyFieldName>((event, emit) {
      emit(state.copyWith(
        isNameFieldEmpty: event.isNameFieldEmpty,
      ));
    });
  }
}
