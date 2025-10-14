import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/helpers/user_type.dart';
import 'package:turbo_waiter/features/auth/data/models/login_body.dart';
import 'package:turbo_waiter/features/auth/data/models/login_response.dart';
import 'package:turbo_waiter/features/auth/data/repo/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl authRepoImpl;
  final LocalStorageHelper storage;

  AuthCubit({required this.authRepoImpl, required this.storage})
    : super(AuthInitial());

  //login
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController userNameLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final loginObscurePasswordNotifier = ValueNotifier<bool>(true);

  Future<void> checkLoginFormValidation() async {
    if (loginFormKey.currentState!.validate()) {
      await login();
    }
  }

  UserData? authResponse;
  Future<void> login() async {
    emit(AuthLoadingState());

    final result = await authRepoImpl.login(
      LoginBody(
        password: passwordLoginController.text,
        username: userNameLoginController.text,
      ),
    );
    result.fold((l) => emit(AuthFailureState(errorMessage: l)), (r) async {
      authResponse = r.data;

      if (authResponse != null &&
          authResponse?.token != null &&
          authResponse!.token!.isNotEmpty &&
          authResponse!.userId != null) {
        await storage.saveToken(authResponse!.token!);
        await storage.saveUserId(authResponse!.userId.toString());
        UserType.instance.setUserLogged(true); // set user type to logged
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState(errorMessage: "Try Again Later"));
      }
    });
  }
}
