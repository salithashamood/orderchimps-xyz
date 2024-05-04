import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final int? id;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  UserResponseModel(this.accessToken, this.id, this.firstName, this.lastName, this.email, this.phoneNumber);

  factory UserResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
