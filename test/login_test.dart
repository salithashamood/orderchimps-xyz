import 'package:flutter_test/flutter_test.dart';
import 'package:xyz/core/service_locator.dart';
import 'package:xyz/data/model/user_login_model.dart';
import 'package:xyz/data/model/user_login_response_model.dart';
import 'package:xyz/domain/usecase/auth_usecase.dart';

void main() {
  group("Login", () {
    setUp(() async {
      await setupLocator();
    });

    test('login with correct details', () async {
      final authUsecase = serviceLocator<AuthUsecase>();

      UserLoginModel userLoginModel =
          UserLoginModel("qaapp2@yopmail.com", "12345678", 1, 1);

      UserLoginResponseModel userLoginResponseModel =
          await authUsecase.loginUser(userLoginModel);

      expect(userLoginResponseModel.accessToken, isNotNull);
    });
  });
}
