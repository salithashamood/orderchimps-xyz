// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseModel _$UserLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserLoginResponseModel(
      json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      accessTokenFromJson(json['access_token'] as String?),
    );

Map<String, dynamic> _$UserLoginResponseModelToJson(
        UserLoginResponseModel instance) =>
    <String, dynamic>{
      'access_token': accessTokenToJson(instance.accessToken),
      'user': instance.user,
    };
