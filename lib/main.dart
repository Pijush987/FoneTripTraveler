import 'package:get_it/get_it.dart';
import 'package:traveler/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/repository/repository.dart';
import 'package:traveler/bloc/theme_bloc/theme_cubit.dart';
import 'package:traveler/bloc/login_bloc/login_bloc.dart';
import 'package:traveler/bloc/signup_bloc/signup_bloc.dart';
import 'package:traveler/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:traveler/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:traveler/bloc/phone_number_verify_bloc/phone_number_verify_bloc.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //call servicesLocator method
  servicesLocator();
// Creating an instance of GetIt

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginApiRepository: getIt()),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(),
        ),
        BlocProvider<PhoneNumberVerifyBloc>(
          create: (context) => PhoneNumberVerifyBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// registerd all repository here
void servicesLocator() {
  getIt.registerLazySingleton<LoginApiRepository>(
    () => LoginMockApiRepository(),
  );
}
