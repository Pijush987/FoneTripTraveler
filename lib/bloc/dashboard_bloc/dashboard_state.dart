part of 'dashboard_bloc.dart';

// Bloc State
class DashboardState extends Equatable {
  final String userName;
  final String phoneNo;
  final String gender;
  final String countryCode;
  final String address;
  final String city;
  final String subAddress;
  final String country;
  final String paymentMethod;

  const DashboardState({
    this.userName = '',
    this.phoneNo = '',
    this.gender = '',
    this.address = '',
    this.city = '',
    this.subAddress = '',
    this.country = '',
    this.paymentMethod = '',
    this.countryCode = '+91',
  });

  DashboardState copyWith(
      {String? userName,
      String? phoneNo,
      String? gender,
      String? countryCode,
      String? address,
      String? city,
      String? subAddress,
      String? country,
      String? paymentMethod}) {
    return DashboardState(
      userName: userName ?? this.userName,
      phoneNo: phoneNo ?? this.phoneNo,
      gender: gender ?? this.gender,
      countryCode: countryCode ?? this.countryCode,
      address: address ?? this.address,
      city: city ?? this.city,
      subAddress: subAddress ?? this.subAddress,
      country: country ?? this.country,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  List<Object> get props => [
        userName,
        phoneNo,
        gender,
        countryCode,
        address,
        city,
        subAddress,
        country,
        paymentMethod
      ];
}
