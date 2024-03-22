import 'package:boilerplate/core/services/network_status.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class InternetConnectionCheckerMock extends Mock implements InternetConnectionChecker {}

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late final InternetConnectionCheckerMock internetConnectionCheckerMock;
  late final ConnectivityMock connectivityMock;
  late final NetworkStatus networkStatus;

  setUp(() {
    internetConnectionCheckerMock = InternetConnectionCheckerMock();
    connectivityMock = ConnectivityMock();
    networkStatus = NetworkStatus(
      internetConnectionChecker: internetConnectionCheckerMock,
      connectivity: connectivityMock,
    );
  });

  group("Internet Status checker", () {
    test("Should return true", () async {
      /// Arrange
      when(() => internetConnectionCheckerMock.hasConnection).thenAnswer((_) async => true);

      /// Act
      final result = await networkStatus.checkConnection();

      /// Assert
      verify(() => internetConnectionCheckerMock.hasConnection).called(1);
      expect(result, networkStatus.isOnline);
    });
  });
}
