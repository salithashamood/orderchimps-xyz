import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:xyz/core/secure_storage.dart';
import 'package:xyz/data/model/user_login_model.dart';
import 'package:xyz/data/model/user_login_response_model.dart';
import 'package:xyz/domain/usecase/auth_usecase.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthUsecase _authUsecase;
  SignInCubit(this._authUsecase) : super(SignInInitial());

  final signInFormKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Future<void> clickSignInButton() async {
    try {
      if (signInFormKey.currentState!.validate()) {
        emit(SignInUserLoginLoading());
        UserLoginModel userLoginModel = UserLoginModel(
            emailTextEditingController.text.trim(),
            passwordTextEditingController.text.trim(),
            1,
            1);
        UserLoginResponseModel userResponseModel =
            await _authUsecase.loginUser(userLoginModel);
        await SecureStorage.setToken(userResponseModel.accessToken ?? '');
        await SecureStorage.setLogin();
        await SecureStorage.setUserDetails(json.encode(userResponseModel.user));
        emit(SignInUserLoginSuccess());
      } else {
        emit(SignInFormNotValidated());
      }
    } catch (e) {
      emit(SignInUserLoginFaield());
    }
  }
}
