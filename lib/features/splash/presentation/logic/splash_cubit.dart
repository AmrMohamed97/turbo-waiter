import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/helpers/user_type.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final LocalStorageHelper localStorageHelper;
  SplashCubit(this.localStorageHelper) : super(SplashState());

  Future<bool> checkIfUserLogged() async {
    String token = await localStorageHelper.getToken();

    if (token.isNotEmpty && !token.contains('No data found!') && token != '') {
      UserType.instance.setUserLogged(true);
      return true;
    } else {
      UserType.instance.setUserLogged(false);
      return false;
    }
  }

  Future<bool> checkFirstLaunch() async {
    String isFirstTimeValue = await localStorageHelper.getFirstTime();

    bool isFirstLaunch =
        isFirstTimeValue.isEmpty ||
            isFirstTimeValue == '' ||
            isFirstTimeValue.contains('No data found!')
        ? true
        : false;

    if (isFirstLaunch) {
      await localStorageHelper.deleteAllSecureData();
      await localStorageHelper.saveFirstTime('launched');
      return true;
    }
    // await localStorage.deleteAllSecureData();
    return false;
  }

  Future<void> assignFirstTime() async {
    await localStorageHelper.saveFirstTime('launched');
  }

  // onboarding section

  int currentPage = 0;
  List<String> images = [

  ];
  void changePage(int page) {
    currentPage = page;
    emit(state.copyWith(currentPage: page));
  }

  void resetPage() {
    currentPage = 0;
    emit(state.copyWith(currentPage: currentPage));
  }
}
