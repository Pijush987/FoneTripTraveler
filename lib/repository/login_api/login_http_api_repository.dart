import '../repository.dart';
import '../../data/data.dart';
import '../../model/model.dart';
import '../../utils/utils.dart';

class LoginHttpApiRepository extends LoginApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<LoginModel> loginApi({data, header}) async {
    final result = await _apiServices.postApi(
        url: AppUrl.loginApi, data: data, header: header);
    return LoginModel.fromJson(result);
  }
}
