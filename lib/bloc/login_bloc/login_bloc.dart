import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/utils/enums/enums.dart';
import 'package:traveler/repository/login_api/login_api_repository.dart';
import 'package:traveler/services/session_manager/session_controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginApiRepository loginApiRepository;

  LoginBloc({required this.loginApiRepository}) : super(const LoginState()) {
    //email change state manage
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });
    //phone number change state manage
    on<LoginPhoneNoChanged>((event, emit) {
      emit(state.copyWith(
        phoneNo: event.phoneNo,
      ));
    });
    //password change state manage
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });
    //country code change state manage
    on<LoginCountryCodeChange>((event, emit) {
      emit(state.copyWith(
        countryCode: event.countryCode,
      ));
    });
    //remember password value change state manage
    on<RememberPassword>((event, emit) {
      emit(state.copyWith(
        isRememberPassword: event.isRememberPassword,
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
    //Login api call
    on<Login>((event, emit) async {
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));

      await loginApiRepository.loginApi(data: {}).then((value) async {
        if (value.error.isNotEmpty) {
          emit(state.copyWith(
              postApiStatus: PostApiStatus.error, message: value.error));
        } else {
          await SessionController().saveUserInPreference(value);
          await SessionController().getUserFromPreference();
          emit(state.copyWith(postApiStatus: PostApiStatus.success));
        }
      }).onError((error, stackTrace) {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error, message: error.toString()));
      });
    });
  }
}
