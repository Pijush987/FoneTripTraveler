import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    //User name change state manage
    on<UsernameChange>((event, emit) {
      emit(state.copyWith(
        userName: event.userName,
      ));
    });
    //phone number change state manage
    on<PhoneNoChanged>((event, emit) {
      emit(state.copyWith(
        phoneNo: event.phoneNo,
      ));
    });

    //country code change state manage
    on<CountryCodeChange>((event, emit) {
      emit(state.copyWith(
        countryCode: event.countryCode,
      ));
    });

    //Gender change state manage
    on<GenderChange>((event, emit) {
      emit(state.copyWith(
        gender: event.gender,
      ));
    });

    //Address change state manage
    on<AddressChange>((event, emit) {
      emit(state.copyWith(
        address: event.adderss,
      ));
    });

    //SubAddress change state manage
    on<SubAddressChange>((event, emit) {
      emit(state.copyWith(
        subAddress: event.subAddress,
      ));
    });

    //City change state manage
    on<CityChange>((event, emit) {
      emit(state.copyWith(
        city: event.city,
      ));
    });

    //country change state manage
    on<CountryChange>((event, emit) {
      emit(state.copyWith(
        country: event.country,
      ));
    });

    //country change state manage
    on<PaymentMethodChange>((event, emit) {
      emit(state.copyWith(
        paymentMethod: event.paymentMethod,
      ));
    });
  }
}
