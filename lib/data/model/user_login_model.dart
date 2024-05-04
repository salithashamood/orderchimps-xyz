import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable()
class UserLoginModel {
  final String email;
  final String password;
  @JsonKey(name: 'remember_me')
  final int rememberMe;
  @JsonKey(name: 'system_user')
  final int systemUser;

  UserLoginModel(this.email, this.password, this.rememberMe, this.systemUser);

  factory UserLoginModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserLoginModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
