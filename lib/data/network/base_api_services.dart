abstract class BaseApiServices {
  Future<dynamic> deleteApi({required String url});
  Future<dynamic> getApi({required String url, String token});
  Future<dynamic> putApi({required String url, dynamic data, dynamic header});
  Future<dynamic> postApi({required String url, dynamic data, dynamic header});
}
