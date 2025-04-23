// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/app_config.dart' as _i562;
import 'package:clean_architecture/core/services/bottom_sheet/bottom_sheet_service.dart'
    as _i883;
import 'package:clean_architecture/core/services/database/isar_database_service.dart'
    as _i700;
import 'package:clean_architecture/core/services/database/local_database_service.dart'
    as _i87;
import 'package:clean_architecture/core/services/dio/dio_client.dart' as _i495;
import 'package:clean_architecture/core/services/dio/dio_client_dev.dart'
    as _i791;
import 'package:clean_architecture/core/services/dio/dio_client_prod.dart'
    as _i265;
import 'package:clean_architecture/core/services/dio/dio_client_stg.dart'
    as _i236;
import 'package:clean_architecture/core/services/image_picker/image_picker_service.dart'
    as _i257;
import 'package:clean_architecture/core/services/internet/internet_service.dart'
    as _i662;
import 'package:clean_architecture/core/services/message/toast_message_service.dart'
    as _i957;
import 'package:clean_architecture/core/services/navigation/navigation_service.dart'
    as _i1005;
import 'package:clean_architecture/core/services/session/session_manager.dart'
    as _i532;
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
    gh.lazySingleton<_i562.AppConfig>(
      () => _i562.AppConfigStg(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i700.IsarDatabaseService>(
        () => _i700.IsarDatabaseServiceImplementation());
    gh.lazySingleton<_i883.BottomSheetService>(
        () => _i883.BottomSheetServiceImplementation());
    gh.lazySingleton<_i257.ImagePickerService>(
        () => _i257.ImagePickerServiceImplementation());
    gh.lazySingleton<_i957.ToastMessageService>(
        () => _i957.ToastMessageServiceImplementation());
    gh.lazySingleton<_i1005.NavigationService>(
        () => _i1005.NavigationServiceImplementation());
    gh.lazySingleton<_i662.InternetService>(
        () => _i662.InternetServiceImplementation());
    gh.lazySingleton<_i87.LocalDatabaseService>(
        () => _i87.LocalDatabaseServiceImplementation());
    gh.lazySingleton<_i562.AppConfig>(
      () => _i562.AppConfigProd(),
      registerFor: {_production},
    );
    gh.lazySingleton<_i562.AppConfig>(
      () => _i562.AppConfigDev(),
      registerFor: {_development},
    );
    gh.lazySingleton<_i322.AuthLocalDataSource>(() =>
        _i322.AuthLocalDataSourceImplementation(
            localDatabase: gh<_i87.LocalDatabaseService>()));
    gh.lazySingleton<_i532.SessionManager>(
        () => _i532.SessionManagerImplementation(
              authLocalDataSource: gh<_i322.AuthLocalDataSource>(),
              navigationService: gh<_i1005.NavigationService>(),
            ));
    gh.lazySingleton<_i495.AuthInterceptor>(() =>
        _i495.AuthInterceptor(sessionManager: gh<_i532.SessionManager>()));
    gh.lazySingleton<_i495.DioClient>(
      () => _i791.DevDioClientImplementation(
        appConfiguration: gh<_i562.AppConfig>(),
        authInterceptor: gh<_i495.AuthInterceptor>(),
      ),
      registerFor: {_development},
    );
    gh.lazySingleton<_i141.AuthRemoteDataSource>(() =>
        _i141.AuthRemoteDataSourceImplementation(
            dioClient: gh<_i495.DioClient>()));
    gh.lazySingleton<_i1003.AuthRepository>(
        () => _i154.AuthRepositoryImplementation(
              internet: gh<_i662.InternetService>(),
              remoteDataSource: gh<_i141.AuthRemoteDataSource>(),
              localDataSource: gh<_i322.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i495.DioClient>(
      () => _i236.StgDioClientImplementation(
        appConfiguration: gh<_i562.AppConfig>(),
        authInterceptor: gh<_i495.AuthInterceptor>(),
      ),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i495.DioClient>(
      () => _i265.ProdDioClientImplementation(
        appConfiguration: gh<_i562.AppConfig>(),
        authInterceptor: gh<_i495.AuthInterceptor>(),
      ),
      registerFor: {_production},
    );
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
