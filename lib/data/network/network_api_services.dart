import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../../utils/utils.dart';
import '../exception/app_exception.dart';
import 'package:traveler/data/network/base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future deleteApi({required String url}) {
    throw UnimplementedError();
  }

  @override
  Future getApi({required String url, String? token}) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: Const.apiTimeOut));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future postApi({required String url, data, header}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final Response response = await post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: Const.apiTimeOut));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future putApi({required String url, data, header}) {
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
