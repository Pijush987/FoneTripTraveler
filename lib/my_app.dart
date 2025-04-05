import 'configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:traveler/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/bloc/theme_bloc/theme_state.dart';
import 'package:traveler/bloc/theme_bloc/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    context.read<ThemeCubit>().updateThemeFromSystem(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.mqWidth, context.mqHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          // text curser hide ..
          return /*Listener(
            onPointerDown: (_) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child:*/
              MaterialApp(
            debugShowCheckedModeBanner: false, //debug banner removed
            title: Const.appTittle, //app name
            theme: state.themeData, // Automatically updates with system theme
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ], //localization delegates
            locale: const Locale('en'), // default selected language
            supportedLocales: const [
              Locale('en'), // English language
              Locale('hi'), // hindi language
            ],
            initialRoute: RoutesName.splash, //default route
            onGenerateRoute: Routes.generateRoute, // generate route
          );
        });
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
