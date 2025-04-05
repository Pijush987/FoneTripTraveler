part of 'dashboard_bloc.dart';

// Bloc Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class UsernameChange extends DashboardEvent {
  final String userName;
  const UsernameChange(this.userName);

  @override
  List<Object> get props => [userName];
}

class PhoneNoChanged extends DashboardEvent {
  final String phoneNo;
  const PhoneNoChanged(this.phoneNo);

  @override
  List<Object> get props => [phoneNo];
}

class GenderChange extends DashboardEvent {
  final String gender;
  const GenderChange(this.gender);

  @override
  List<Object> get props => [gender];
}

class AddressChange extends DashboardEvent {
  final String adderss;
  const AddressChange(this.adderss);

  @override
  List<Object> get props => [adderss];
}

class CountryCodeChange extends DashboardEvent {
  final String countryCode;
  const CountryCodeChange(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

class CityChange extends DashboardEvent {
  final String city;
  const CityChange(this.city);

  @override
  List<Object> get props => [city];
}

class SubAddressChange extends DashboardEvent {
  final String subAddress;
  const SubAddressChange(this.subAddress);

  @override
  List<Object> get props => [subAddress];
}

class CountryChange extends DashboardEvent {
  final String country;
  const CountryChange(this.country);

  @override
  List<Object> get props => [country];
}

class PaymentMethodChange extends DashboardEvent {
  final String paymentMethod;
  const PaymentMethodChange(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}
