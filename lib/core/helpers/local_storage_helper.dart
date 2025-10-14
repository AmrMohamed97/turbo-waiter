import 'package:turbo_waiter/core/helpers/app_constants.dart';
import 'package:turbo_waiter/core/helpers/local_storage.dart';

class LocalStorageHelper {
  final LocalStorage localStorage;

  LocalStorageHelper({required this.localStorage});

  Future<void> saveToken(String token) async {
    await localStorage.writeSecureData(AppConstants.tokenKey, token);
  }

  Future<String> getToken() async {
    return await localStorage.readSecureData(AppConstants.tokenKey);
  }

  // ticket
  Future<void> saveTicket(String token) async {
    await localStorage.writeSecureData(AppConstants.ticketIdKey, token);
  }

  Future<String> getTicket() async {
    return await localStorage.readSecureData(AppConstants.ticketIdKey);
  }

  Future<void> deleteTicket() async {
    await deleteSecureData(AppConstants.ticketIdKey);
  }

  Future<void> saveUserId(String userId) async {
    await localStorage.writeSecureData(AppConstants.userIdKey, userId);
  }

  Future<String> getUserId() async {
    return await localStorage.readSecureData(AppConstants.userIdKey);
  }

  Future<void> saveUserEmail(String userEmail) async {
    await localStorage.writeSecureData(AppConstants.userEmail, userEmail);
  }

  Future<String> getUserEmail() async {
    return await localStorage.readSecureData(AppConstants.userEmail);
  }

  Future<void> saveFirstTime(String firstTime) async {
    await localStorage.writeSecureData(AppConstants.firstTime, firstTime);
  }

  Future<String> getFirstTime() async {
    return await localStorage.readSecureData(AppConstants.firstTime);
  }

  Future<void> saveUserType(int type) async {
    await localStorage.writeSecureData(AppConstants.userType, type.toString());
  }

  Future<int> getUserType() async {
    return int.tryParse(
          await localStorage.readSecureData(AppConstants.userType),
        ) ??
        -1;
  }

  Future<void> saveLangCode(String value) async {
    await localStorage.writeSecureData(AppConstants.langCode, value.toString());
  }

  Future<String> getLangCode() async {
    return await localStorage.readSecureData(AppConstants.langCode);
  }

  Future<void> saveCountryCode(String value) async {
    await localStorage.writeSecureData(
      AppConstants.countryCode,
      value.toString(),
    );
  }

  Future<String> getCountryCode() async {
    return await localStorage.readSecureData(AppConstants.countryCode);
  }

  Future<void> deleteSecureData(String key) async {
    await localStorage.deleteSecureData(key);
  }

  Future<void> deleteToken() async {
    await deleteSecureData(AppConstants.tokenKey);
  }

  Future<void> logOut() async {
    await localStorage.deleteSecureData(AppConstants.tokenKey);
    await localStorage.deleteSecureData(AppConstants.userIdKey);
    await localStorage.deleteSecureData(AppConstants.userEmail);
    await localStorage.deleteSecureData(AppConstants.userType);
  }

  Future<void> deleteAllSecureData() async {
    await localStorage.deleteAllSecureData();
  }
}
