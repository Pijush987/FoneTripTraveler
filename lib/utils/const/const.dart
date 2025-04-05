import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:page_transition/page_transition.dart';

class Const {
  static int apiTimeOut = 30;
  static PageTransitionType pageTransitionType = PageTransitionType.rightToLeft;

  /// fonts family
  static const monaSansRegular = 'Mona Sans';
  static const poppins = 'Poppins';
  static const poppinsMedium = 'Poppins Medium';
  static const poppinsBold = 'Poppins Bold';

  static String baseUrl = 'https://api.avvtar.com/';
  static String appTittle = 'Avvtar';
  static String appVersion = 'v1.0.0';

  static double textFieldHight = 40;
  static double editTextFieldHight = 38;

  static const countryPicker = FlCountryCodePicker();
}
