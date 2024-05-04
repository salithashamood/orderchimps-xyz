import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xyz/core/const_variable.dart';
import 'package:xyz/core/enum_value.dart';
import 'package:xyz/core/http_request.dart';
import 'package:xyz/data/model/user_login_model.dart';
import 'package:xyz/data/model/user_login_response_model.dart';
import 'package:xyz/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HttpRequest _httpRequest;

  AuthRepositoryImpl(this._httpRequest);

  @override
  Future<UserLoginResponseModel> loginUser(
      UserLoginModel userLoginModel) async {
    try {
      Response response = await _httpRequest.createRequest(
          HttpRequstMethod.POST, login,
          body: userLoginModel.toJson());
      UserLoginResponseModel userLoginResponseModel =
          UserLoginResponseModel.fromJson(response.data);
      _httpRequest.addTokenToHeader(userLoginResponseModel.accessToken ?? '');
      return userLoginResponseModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
