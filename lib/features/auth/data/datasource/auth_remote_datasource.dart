import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/networking/api_service.dart';
import 'package:turbo_waiter/core/networking/api_urls.dart';
import 'package:turbo_waiter/features/auth/data/models/login_body.dart';
// import 'package:turbo_waiter/features/auth/data/models/sign_up_body.dart';

class AuthRemoteDatasource {
  final ApiService apiService;

  const AuthRemoteDatasource({required this.apiService});

  Future<Response> login(LoginBody loginBody) async {
    final Response response = await apiService.post(
      endPoint: ApiUrls.login,
      data: loginBody.toJson(),
      auth: false,
      sendLang: false,
    );
    return response;
  }
}
