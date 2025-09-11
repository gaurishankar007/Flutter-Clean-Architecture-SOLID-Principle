import 'package:clean_architecture/core/services/api/api_service.dart';
import 'package:clean_architecture/core/services/database/local_database_service.dart';
import 'package:clean_architecture/core/services/internet/internet_service.dart';
import 'package:clean_architecture/core/services/navigation/navigation_service.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

class MockAuthInterceptor extends Mock implements AuthInterceptor {}


class MockInternetService extends Mock implements InternetService {}

class MockLocalDatabaseService extends Mock implements LocalDatabaseService {}

class MockNavigationService extends Mock implements NavigationService {}
