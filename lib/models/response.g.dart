// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Response _$$_ResponseFromJson(Map<String, dynamic> json) => _$_Response(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$$_ResponseToJson(_$_Response instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
