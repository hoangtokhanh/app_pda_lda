import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'authentication.freezed.dart';
part 'authentication.g.dart';

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    @JsonKey(name: 'user') String? user,
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'role') String? role,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, Object?> json) =>
      _$AuthenticationFromJson(json);

}
