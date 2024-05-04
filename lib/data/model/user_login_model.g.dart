// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) =>
    UserLoginModel(
      json['email'] as String,
      json['password'] as String,
      (json['remember_me'] as num).toInt(),
      (json['system_user'] as num).toInt(),
    );

Map<String, dynamic> _$UserLoginModelToJson(UserLoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'remember_me': instance.rememberMe,
      'system_user': instance.systemUser,
    };
