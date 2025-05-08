// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/app_config.dart' as _i1068;
import 'package:clean_architecture/config/routes/routes.dart' as _i706;
import 'package:clean_architecture/core/services/api/api_service.dart' as _i885;
import 'package:clean_architecture/core/services/api/api_service_dev.dart'
    as _i897;
import 'package:clean_architecture/core/services/api/api_service_prod.dart'
    as _i408;
import 'package:clean_architecture/core/services/api/api_service_stg.dart'
    as _i510;
import 'package:clean_architecture/core/services/bottom_sheet/bottom_sheet_service.dart'
    as _i883;
import 'package:clean_architecture/core/services/database/local_database_service.dart'
    as _i87;
import 'package:clean_architecture/core/services/image_picker/image_picker_service.dart'
    as _i257;
import 'package:clean_architecture/core/services/internet/internet_service.dart'
    as _i662;
import 'package:clean_architecture/core/services/message/toast_message_service.dart'
    as _i957;
import 'package:clean_architecture/core/services/navigation/navigation_service.dart'
    as _i1005;
import 'package:clean_architecture/core/services/session/session_manager.dart'
    as _i558;
import 'package:clean_architecture/features/auth/data/data_sources/auth_local_data_source.dart'
    as _i322;
import 'package:clean_architecture/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i141;
import 'package:clean_architecture/features/auth/data/repositories/auth_repository_implementation.dart'
    as _i154;
import 'package:clean_architecture/features/auth/domain/repositories/auth_repository.dart'
    as _i1003;
import 'package:clean_architecture/features/auth/domain/use_cases/check_authentication_use_case.dart'
    as _i481;
import 'package:clean_architecture/features/auth/domain/use_cases/get_user_data_use_case.dart'
    as _i817;
import 'package:clean_architecture/features/auth/domain/use_cases/login_use_case.dart'
    as _i68;
import 'package:clean_architecture/features/auth/domain/use_cases/save_user_data_use_case.dart'
    as _i661;
import 'package:clean_architecture/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i912;
import 'package:clean_architecture/features/auth/presentation/cubits/login/login_cubit_use_cases.dart'
    as _i123;
import 'package:clean_architecture/features/dashboard/presentation/cubits/dashboard/dashboard_cubit.dart'
    as _i278;
import 'package:clean_architecture/features/dashboard/presentation/cubits/dashboard/dashboard_cubit_use_cases.dart'
    as _i134;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initialize({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localDatabaseModule = _$LocalDatabaseModule();
    final navigationServiceModule = _$NavigationServiceModule();
    final imagePickerServiceModule = _$ImagePickerServiceModule();
    final internetServiceModule = _$InternetServiceModule();
    final apiServiceModule = _$ApiServiceModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localDatabaseModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i706.AppRouter>(() => navigationServiceModule.appRouter);
    gh.lazySingleton<_i183.ImagePicker>(
        () => imagePickerServiceModule.imagePicker);
    gh.lazySingleton<_i161.InternetConnection>(
        () => internetServiceModule.internetConnection);
    gh.lazySingleton<_i361.Dio>(() => apiServiceModule.dio);
    gh.lazySingleton<_i257.ImagePickerService>(() =>
        _i257.ImagePickerServiceImplementation(
            imagePicker: gh<_i183.ImagePicker>()));
    gh.lazySingleton<_i1068.AppConfig>(
      () => _i1068.AppConfigStg(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i1068.AppConfig>(
      () => _i1068.AppConfigProd(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i662.InternetService>(() =>
        _i662.InternetServiceImplementation(
            internetConnection: gh<_i161.InternetConnection>()));
    gh.lazySingleton<_i87.LocalDatabaseService>(() =>
        _i87.LocalDatabaseServiceImplementation(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1068.AppConfig>(
      () => _i1068.AppConfigDev(),
      registerFor: {_development},
    );
    gh.lazySingleton<_i1005.NavigationService>(() =>
        _i1005.NavigationServiceImplementation(
            appRouter: gh<_i706.AppRouter>()));
    gh.lazySingleton<_i883.BottomSheetService>(() =>
        _i883.BottomSheetServiceImplementation(
            navigationService: gh<_i1005.NavigationService>()));
    gh.lazySingleton<_i322.AuthLocalDataSource>(() =>
        _i322.AuthLocalDataSourceImplementation(
            localDatabase: gh<_i87.LocalDatabaseService>()));
    gh.lazySingleton<_i957.ToastMessageService>(() =>
        _i957.ToastMessageServiceImplementation(
            navigationService: gh<_i1005.NavigationService>()));
    gh.lazySingleton<_i558.SessionManager>(
        () => _i558.SessionManagerImplementation(
              authLocalDataSource: gh<_i322.AuthLocalDataSource>(),
              navigationService: gh<_i1005.NavigationService>(),
            ));
    gh.lazySingleton<_i885.AuthInterceptor>(() =>
        _i885.AuthInterceptor(sessionManager: gh<_i558.SessionManager>()));
    gh.lazySingleton<_i885.ApiService>(
      () => _i897.ApiServiceDev(
        dio: gh<_i361.Dio>(),
        appConfiguration: gh<_i1068.AppConfig>(),
        authInterceptor: gh<_i885.AuthInterceptor>(),
      ),
      registerFor: {_development},
    );
    gh.lazySingleton<_i885.ApiService>(
      () => _i408.ApiServiceProd(
        dio: gh<_i361.Dio>(),
        appConfiguration: gh<_i1068.AppConfig>(),
        authInterceptor: gh<_i885.AuthInterceptor>(),
      ),
      registerFor: {_production},
    );
    gh.lazySingleton<_i885.ApiService>(
      () => _i510.ApiServiceStg(
        dio: gh<_i361.Dio>(),
        appConfiguration: gh<_i1068.AppConfig>(),
        authInterceptor: gh<_i885.AuthInterceptor>(),
      ),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i141.AuthRemoteDataSource>(() =>
        _i141.AuthRemoteDataSourceImplementation(
            dioClient: gh<_i885.ApiService>()));
    gh.lazySingleton<_i1003.AuthRepository>(
        () => _i154.AuthRepositoryImplementation(
              internet: gh<_i662.InternetService>(),
              remoteDataSource: gh<_i141.AuthRemoteDataSource>(),
              localDataSource: gh<_i322.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i817.GetUserDataUseCase>(() =>
        _i817.GetUserDataUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i661.SaveUserDataUseCase>(() =>
        _i661.SaveUserDataUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i481.CheckAuthenticationUseCase>(() =>
        _i481.CheckAuthenticationUseCase(
            authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i68.LoginUseCase>(
        () => _i68.LoginUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i134.DashboardCubitUseCases>(() =>
        _i134.DashboardCubitUseCases(
            checkAuthentication: gh<_i481.CheckAuthenticationUseCase>()));
    gh.lazySingleton<_i123.LoginCubitUseCases>(() => _i123.LoginCubitUseCases(
          login: gh<_i68.LoginUseCase>(),
          saveUserData: gh<_i661.SaveUserDataUseCase>(),
        ));
    gh.factory<_i912.LoginCubit>(
        () => _i912.LoginCubit(useCases: gh<_i123.LoginCubitUseCases>()));
    gh.factory<_i278.DashboardCubit>(() =>
        _i278.DashboardCubit(useCases: gh<_i134.DashboardCubitUseCases>()));
    return this;
  }
}

class _$LocalDatabaseModule extends _i87.LocalDatabaseModule {}

class _$NavigationServiceModule extends _i1005.NavigationServiceModule {}

class _$ImagePickerServiceModule extends _i257.ImagePickerServiceModule {}

class _$InternetServiceModule extends _i662.InternetServiceModule {}

class _$ApiServiceModule extends _i885.ApiServiceModule {}
