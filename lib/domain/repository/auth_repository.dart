import 'package:xyz/data/model/user_login_model.dart';
import 'package:xyz/data/model/user_login_response_model.dart';

abstract class AuthRepository {

  Future<UserLoginResponseModel> loginUser(UserLoginModel userLoginModel);
}
