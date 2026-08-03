import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'redirect_to')
  final String redirectTo;

  final Object? profile;

  const LoginData({required this.redirectTo, this.profile});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
