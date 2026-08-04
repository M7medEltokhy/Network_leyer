// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  redirectTo: json['redirect_to'] as String,
  profile: json['profile'],
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'redirect_to': instance.redirectTo,
      'profile': instance.profile,
    };
