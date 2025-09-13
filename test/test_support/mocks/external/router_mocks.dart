import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/core/config/routes/routes.dart';
import 'package:mocktail/mocktail.dart';

class MockAppRouter extends Mock implements AppRouter {}

class MockDefaultRouteParser extends Mock implements DefaultRouteParser {}

class MockPageRouteInfo extends Mock implements PageRouteInfo<dynamic> {}
