import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/helpers/app_constants.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.localStorageHelper) : super(LanguageInitial());
  final LocalStorageHelper localStorageHelper;
  //Language
  Locale _locale = const Locale('ar', 'EG');
  Locale get locale => _locale;
  Future<void> setLanguage(Locale locale, BuildContext context) async {
    _locale = locale;
    await _saveLanguage(_locale);

    await EasyLocalization.of(context)?.setLocale(_locale);
    context.pushNamedAndRemoveUntil(
      Routes.mainAppScreen,
      predicate: (route) => false,
    );
  }

  Future<void> _saveLanguage(Locale locale) async {
    await localStorageHelper.deleteSecureData(AppConstants.langCode);
    await localStorageHelper.deleteSecureData(AppConstants.countryCode);
    await localStorageHelper.saveLangCode(locale.languageCode);
    await localStorageHelper.saveCountryCode(locale.countryCode ?? 'US');
  }
}
