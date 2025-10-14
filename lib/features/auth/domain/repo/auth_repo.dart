import 'package:dartz/dartz.dart';
import 'package:turbo_waiter/core/models/general_response.dart';
// import 'package:turbo_waiter/core/networking/empty_response.dart';
import 'package:turbo_waiter/features/auth/data/models/login_body.dart';
import 'package:turbo_waiter/features/auth/data/models/login_response.dart';
// import 'package:turbo_waiter/features/auth/data/models/sign_up_body.dart';

abstract class AuthRepo {
  Future<Either<String, GeneralResponse<UserData>>> login(LoginBody loginBody);
  // Future<Either<String, LoginResponse>> externalLogin(
  //   ExternalLoginBody externalLoginBody,
  // );
  // Future<Either<EmptyResponse, LoginResponse>> signUp(SignUpBody signUpBody);
  // Future<Either<String, dynamic>> generateOTP(String phone);
  // Future<Either<String, dynamic>> verifyOTP(String phone, String otp);
}
