import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xyz/core/secure_storage.dart';
import 'package:xyz/data/model/user_response_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    setAccountData();
  }

  Future<void> setAccountData() async {
    emit(ProfileDataLoading());
    String? userDetailsString = await SecureStorage.getUserDetails();
    if (userDetailsString != null) {
      UserResponseModel userResponseModel =
          UserResponseModel.fromJson(json.decode(userDetailsString));
      emit(ProfileDataLoaded(userResponseModel: userResponseModel));
    }
  }

  void logOut() {
    SecureStorage.removeAll();
    emit(ProfileLogout());
  }
}
