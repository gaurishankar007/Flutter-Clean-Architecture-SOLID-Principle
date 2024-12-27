import '../../../../core/utils/type_defs.dart';
import '../requests/login_request.dart';
import '../entities/user_data.dart';

abstract class AuthRepository {
  FutureData<UserData> login(LoginRequest request);
  FutureBool saveUserData(UserData userData);
  FutureData<UserData> getUserData();
  FutureBool checkAUth();
}
