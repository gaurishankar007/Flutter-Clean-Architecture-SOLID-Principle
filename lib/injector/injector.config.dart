// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/app_configuration.dart' as _i562;
import 'package:clean_architecture/core/services/dio/dio_client.dart' as _i495;
import 'package:clean_architecture/core/services/dio/dio_client_dev.dart'
    as _i791;
import 'package:clean_architecture/core/services/dio/dio_client_prod.dart'
    as _i265;
import 'package:clean_architecture/core/services/image_picker/image_picker_service.dart'
    as _i257;
import 'package:clean_architecture/core/services/internet_service.dart'
    as _i481;
import 'package:clean_architecture/core/services/isar_database_service.dart'
    as _i826;
import 'package:clean_architecture/core/services/local_database_service.dart'
    as _i42;
import 'package:clean_architecture/core/services/message/toast_message_service.dart'
    as _i957;
import 'package:clean_architecture/core/services/navigation/navigation_service.dart'
    as _i1005;
import 'package:clean_architecture/core/services/user_data_service.dart'
    as _i931;
import 'package:clean_architecture/features/auth/data/data_sources/auth_local_data_source.dart'
    as _i322;
import 'package:clean_architecture/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i141;
import 'package:clean_architecture/features/auth/data/repositories/auth_repository_implementation.dart'
    as _i154;
import 'package:clean_architecture/features/auth/domain/entities/login_use_cases.dart'
    as _i756;
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
import 'package:clean_architecture/features/dashboard/domain/entities/dashboard_use_cases.dart'
    as _i735;
import 'package:clean_architecture/features/dashboard/presentation/cubits/dashboard/dashboard_cubit.dart'
    as _i278;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initialize({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i562.AppConfiguration>(
      () => const _i562.StgAppConfiguration(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i42.LocalDatabaseService>(
        () => _i42.LocalDatabaseServiceImplementation());
    gh.lazySingleton<_i826.IsarDatabaseService>(
        () => _i826.IsarDatabaseServiceImplementation());
    gh.lazySingleton<_i257.ImagePickerService>(
        () => _i257.ImagePickerServiceImplementation());
    gh.lazySingleton<_i957.ToastMessageService>(
        () => _i957.ToastMessageServiceImplementation());
    gh.lazySingleton<_i1005.NavigationService>(
        () => _i1005.NavigationServiceImplementation());
    gh.lazySingleton<_i481.InternetService>(
        () => _i481.InternetServiceImplementation());
    gh.lazySingleton<_i562.AppConfiguration>(
      () => const _i562.ProdAppConfiguration(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i322.AuthLocalDataSource>(() =>
        _i322.AuthLocalDataSourceImplementation(
            localDatabase: gh<_i42.LocalDatabaseService>()));
    gh.lazySingleton<_i562.AppConfiguration>(
      () => const _i562.DevAppConfiguration(),
      registerFor: {_development},
    );
    gh.lazySingleton<_i931.UserDataService>(
        () => _i931.UserDataServiceImplementation(
              localDatabase: gh<_i42.LocalDatabaseService>(),
              navigationService: gh<_i1005.NavigationService>(),
            ));
    gh.lazySingleton<_i495.AuthenticationInterceptor>(() =>
        _i495.AuthenticationInterceptor(
            userDataService: gh<_i931.UserDataService>()));
    gh.lazySingleton<_i495.DioClient>(
      () => _i265.ProdDioClientImplementation(
        appConfig: gh<_i562.AppConfiguration>(),
        authenticationInterceptor: gh<_i495.AuthenticationInterceptor>(),
      ),
      registerFor: {_production},
    );
    gh.lazySingleton<_i141.AuthRemoteDataSource>(() =>
        _i141.AuthRemoteDataSourceImplementation(
            dioClient: gh<_i495.DioClient>()));
    gh.lazySingleton<_i495.DioClient>(
      () => _i791.DevDioClientImplementation(
        appConfig: gh<_i562.AppConfiguration>(),
        authenticationInterceptor: gh<_i495.AuthenticationInterceptor>(),
      ),
      registerFor: {
        _staging,
        _development,
      },
    );
    gh.lazySingleton<_i1003.AuthRepository>(
        () => _i154.AuthRepositoryImplementation(
              internet: gh<_i481.InternetService>(),
              remoteDataSource: gh<_i141.AuthRemoteDataSource>(),
              localDataSource: gh<_i322.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i481.CheckAuthenticationUseCase>(() =>
        _i481.CheckAuthenticationUseCase(
            authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i817.GetUserDataUseCase>(() =>
        _i817.GetUserDataUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i68.LoginUseCase>(
        () => _i68.LoginUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i661.SaveUserDataUseCase>(() =>
        _i661.SaveUserDataUseCase(authRepository: gh<_i1003.AuthRepository>()));
    gh.lazySingleton<_i735.DashboardUseCases>(() => _i735.DashboardUseCases(
        checkAuthentication: gh<_i481.CheckAuthenticationUseCase>()));
    gh.lazySingleton<_i756.LoginUseCases>(() => _i756.LoginUseCases(
          login: gh<_i68.LoginUseCase>(),
          saveUserData: gh<_i661.SaveUserDataUseCase>(),
        ));
    gh.factory<_i912.LoginCubit>(
        () => _i912.LoginCubit(useCases: gh<_i756.LoginUseCases>()));
    gh.factory<_i278.DashboardCubit>(
        () => _i278.DashboardCubit(useCases: gh<_i735.DashboardUseCases>()));
    return this;
  }
}
