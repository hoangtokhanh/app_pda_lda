import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@immutable
class User with _$User {
  const User._();
  const factory User({
    @JsonKey(name: 'user') String? user,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'des') String? des,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

}
