import '../../../../core/resources/data_state.dart';
import '../entities/user_data.dart';
import '../forms/sign_in_form.dart';
import '../forms/sign_up_form.dart';

abstract class AuthRepository {
  FutureData<UserData> signIn(SignInForm parameter);
  FutureData<UserData> signUp(SignUpForm parameter);
  FutureData<UserData> getUserData();
  FutureBool saveUserData(UserData userData);
}
