import 'dart:io';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/useCases/get_token_uc.dart';
import 'package:boilerplate/injection/injector.dart';

class AppData {
  AppData._();

  bool _initialized = false;
  TokenDataModel _tokenDataModel = TokenDataModel.empty();
  static final AppData _singleton = AppData._();
  factory AppData() => _singleton;

  Future init() async {
    if (_initialized) return;
    _initialized = true;

    HttpOverrides.global = MyHttpOverrides();
    initializeDependencies();
    await networkService.listen();
    await _checkLogin();
  }

  _checkLogin() async {
    final data = await GetTokenUseCase(authRepoImpl).call();

    if (data is SuccessState) {
      _tokenDataModel = data.data!;
    }
  }

  set setTokenModel(TokenDataModel tokenModel) => _tokenDataModel = tokenModel;

  TokenDataModel get tokenDataModel => _tokenDataModel;
  removeTokenModel() => _tokenDataModel = TokenDataModel.empty();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
