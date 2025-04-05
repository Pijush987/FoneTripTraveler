import 'package:traveler/model/login_model/login_model.dart';

abstract class LoginApiRepository {
  Future<LoginModel> loginApi({dynamic data, dynamic header});
}
