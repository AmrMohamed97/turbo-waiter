import 'package:dartz/dartz.dart';
import 'package:turbo_waiter/core/models/general_response.dart';
// import 'package:dio/dio.dart';
import 'package:turbo_waiter/core/networking/api_error_handler.dart';
// import 'package:turbo_waiter/core/networking/empty_response.dart';
import 'package:turbo_waiter/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:turbo_waiter/features/auth/data/models/login_body.dart';
import 'package:turbo_waiter/features/auth/data/models/login_response.dart';
// import 'package:turbo_waiter/features/auth/data/models/sign_up_body.dart';
import 'package:turbo_waiter/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepoImpl({required this.authRemoteDatasource});

  @override
  Future<Either<String, GeneralResponse<UserData>>> login(
    LoginBody loginBody,
  ) async {
    try {
      var result = await authRemoteDatasource.login(loginBody);
      if (result.statusCode == 200) {
        return right(
          GeneralResponse<UserData>.fromJson(
            result.data,
            dataFromJson: (j) => UserData.fromJson(j),
          ),
        );
      } else {
        return left(result.data['message'] ?? '');
      }
    } catch (e) {
      return left(ErrorHandler.handle(e).failure.message ?? '');
    }
  }
}
