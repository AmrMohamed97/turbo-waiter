import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/helpers/app_constants.dart';
import 'package:turbo_waiter/core/helpers/local_storage.dart';

class ApiService {
  final Dio dio;
  final LocalStorage storage;

  ApiService(this.dio, this.storage);

  Future<Response> get({
    required String endPoint,
    dynamic data,
    dynamic params,
    bool auth = true,
  }) async {
    Map<String, dynamic>? headers;
    String lang = await storage.readSecureData(AppConstants.langCode);
    // String deviceId = await storage.readSecureData(AppConstants.deviceId);
    // Map<String, dynamic>? extraParams;

    String token = '';
    if (auth) {
      token = await storage.readSecureData(AppConstants.tokenKey);
      if (token.isNotEmpty) {
        headers = {
          "Authorization": 'Bearer $token',
          "Accept-Language": lang.isNotEmpty ? lang : 'ar',
        };
      } else {
        headers = {"lang": lang.isNotEmpty ? lang : 'ar'};
        // if (deviceId.isNotEmpty) {
        //   extraParams = {
        //     'device_id': deviceId,
        //   };
        // }
      }
    } else {
      headers = {"lang": lang.isNotEmpty ? lang : 'ar'};
    }
    var response = await dio.get(
      endPoint,
      data: data,
      queryParameters: {
        if (params != null) ...params,
        // if (deviceId.isNotEmpty && extraParams != null) ...extraParams,
        // 'lang': lang.isNotEmpty ? lang : 'ar'
      },
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    dynamic params,
    bool auth = true,
    bool sendLang = true,
  }) async {
    Map<String, dynamic>? headers;
    String? lang = await storage.readSecureData(AppConstants.langCode);
    // String deviceId = await storage.readSecureData(AppConstants.deviceId);
    // Map<String, dynamic>? extraBody;
    String token = '';
    if (auth) {
      token = await storage.readSecureData(AppConstants.tokenKey);
      if (token.isNotEmpty) {
        headers = {"Authorization": 'Bearer $token'};
      } else {
        // if (deviceId.isNotEmpty) {
        //   extraBody = {
        //     'device_id': deviceId,
        //   };
        // }
      }
    }
    if (data is Map<String, dynamic>?) {
      data = sendLang
          ? {
              if (data != null) ...data,
              // if (deviceId.isNotEmpty && extraBody != null) ...extraBody,
              'lang': lang.isNotEmpty ? lang : 'ar',
            }
          : {if (data != null) ...data};
    }
    var response = await dio.post(
      endPoint,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> put({required String endPoint, dynamic data}) async {
    var token = await storage.readSecureData(AppConstants.tokenKey);

    var response = await dio.put(
      endPoint,
      options: Options(headers: {"Authorization": 'Bearer $token'}),
      data: data,
    );
    return response;
  }

  Future<Response> delete({required String endPoint}) async {
    var token = await storage.readSecureData(AppConstants.tokenKey);

    var response = await dio.delete(
      endPoint,
      options: Options(headers: {"Authorization": 'Bearer $token'}),
    );
    return response;
  }
}
