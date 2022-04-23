import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class Response with _$Response {
  const factory Response(
      {required int code,
      required String msg,
      required String data}) = _Response;
  factory Response.fromJson(Map<String, Object?> json) =>
      _$ResponseFromJson(json);
}
