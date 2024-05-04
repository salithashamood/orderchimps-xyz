import 'package:xyz/data/model/user_login_model.dart';
import 'package:xyz/data/model/user_login_response_model.dart';
import 'package:xyz/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<UserLoginResponseModel> loginUser(UserLoginModel userLoginModel) async {
    return await _authRepository.loginUser(userLoginModel);
  }
}
