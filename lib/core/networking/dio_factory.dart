import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/di/dependancy_injection.dart';
import 'package:turbo_waiter/core/helpers/app_initialization.dart';
import 'package:turbo_waiter/core/helpers/local_storage.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/networking/api_urls.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  ///Private Construct as i don't want to allow creating instance of this class
  DioFactory._();

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();

      dio!
        ..options.baseUrl = ApiUrls.baseUrl
        ..options.headers = {
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        }
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors
      ?..add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ),
      )
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // // Add the access token to the request header
            LocalStorageHelper storage = LocalStorageHelper(
              localStorage: LocalStorage(),
            );
            String token = await storage.getToken();
            options.headers['Authorization'] = 'Bearer $token';
            options.headers['Accept-Language'] = "ar";

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401 &&
                !e.requestOptions.uri.toString().contains(ApiUrls.login)) {
              //   String? newAccessToken = await refreshToken();

              //   if (newAccessToken != null && newAccessToken.isNotEmpty) {
              //     // Update the request header with the new access token
              //     e.requestOptions.headers['Authorization'] =
              //         'Bearer $newAccessToken';

              //     // Repeat the request with the updated header
              //     return handler.resolve(await dio!.fetch(e.requestOptions));
              //   } else {
              // If the new access token is null or empty, then logout the user
              await getIt<LocalStorageHelper>().deleteToken().then(
                (value) =>
                    navigatorKey.currentState!.pushNamed(Routes.loginScreen),
              );
            }

            return handler.next(e);
          },
        ),
      );
  }
}
