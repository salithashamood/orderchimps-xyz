import 'package:json_annotation/json_annotation.dart';
import 'package:xyz/data/model/user_response_model.dart';

part 'user_login_response_model.g.dart';

@JsonSerializable()
class UserLoginResponseModel {
  @JsonKey(
    name: 'access_token',
    fromJson: accessTokenFromJson,
    toJson: accessTokenToJson,
  )
  final String? accessToken;
  final UserResponseModel? user;

  UserLoginResponseModel(this.user, this.accessToken);

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserLoginResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserLoginResponseModelToJson(this);
}

String? accessTokenFromJson(String? accessToken) {
  return accessToken;
}

String? accessTokenToJson(String? accessToken) => accessToken;
