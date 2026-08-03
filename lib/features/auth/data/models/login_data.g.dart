// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  redirectTo: json['redirect_to'] as String,
  profile: json['profile'],
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'redirect_to': instance.redirectTo,
  'profile': instance.profile,
};
