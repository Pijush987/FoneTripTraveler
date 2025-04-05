import '../repository.dart';
import '../../model/model.dart';

class LoginMockApiRepository extends LoginApiRepository {
  @override
  Future<LoginModel> loginApi({data, header}) async {
    await Future.delayed(const Duration(seconds: 2));
    var responseData = {'token': '67456'};
    return LoginModel.fromJson(responseData);
  }
}
