// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      user: json['user'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      des: json['des'] as String?,
      role: json['role'] as String?,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'user': instance.user,
      'username': instance.username,
      'password': instance.password,
      'des': instance.des,
      'role': instance.role,
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
    };
