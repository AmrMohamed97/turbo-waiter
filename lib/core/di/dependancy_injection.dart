// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:turbo_waiter/core/cubit/cubit/language_cubit.dart';
import 'package:turbo_waiter/core/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:turbo_waiter/core/helpers/enums_repo.dart';
import 'package:turbo_waiter/core/helpers/local_storage.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/networking/api_service.dart';
import 'package:turbo_waiter/core/networking/dio_factory.dart';
import 'package:turbo_waiter/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:turbo_waiter/features/auth/data/repo/auth_repo_impl.dart';
import 'package:turbo_waiter/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:turbo_waiter/features/splash/presentation/logic/splash_cubit.dart';
import 'package:turbo_waiter/features/ticket_details/data/datasources/get_remote_ticket_details.dart';
import 'package:turbo_waiter/features/ticket_details/data/repositories/get_ticket_details_repo_imple.dart';
import 'package:turbo_waiter/features/ticket_details/domain/repositories/get_ticket_details_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //*Dio $ ApiService

  Dio dio = await DioFactory.getDio();
  LocalStorage storage = LocalStorage();
  //*AppServiceClient instance
  getIt.registerLazySingleton<LocalStorageHelper>(
    () => LocalStorageHelper(localStorage: storage),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio, storage));
  // *splash
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt()));
  // *toggle
  getIt.registerFactory<ToggleCubit>(() => ToggleCubit());
  //*bottom nav
  // getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  // //*drawer
  // getIt.registerFactory<DrawerCubit>(() => DrawerCubit());

  //*auth
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(apiService: getIt()),
  );

  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(authRemoteDatasource: getIt()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(authRepoImpl: getIt(), storage: getIt()),
  );

  getIt.registerFactory<GetTicketDetailsRepo>(
    () => GetTicketDetailsRepoImple(
      getRemoteTicketDetails: GetRemoteTicketDetailsImple(dio),
    ),
  );
  getIt.registerFactory<EnumsRepo>(
    () => EnumsRepo(
      enumsRemoteImple: EnumsRemoteImple(apiService: getIt<ApiService>()),
    ),
  );

  // getIt.registerFactory<TravelCubit>(() => TravelCubit(getIt(), getIt()));
  // //*Wallet
  // getIt.registerLazySingleton<WalletWebService>(
  //   () => WalletWebService(getIt()),
  // );

 
  // getIt.registerFactory<WalletCubit>(() => WalletCubit(getIt()));

  //*Language

  getIt.registerFactory<LanguageCubit>(() => LanguageCubit(getIt()));
}
