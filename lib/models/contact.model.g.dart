// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
      id: json['id'] as int,
      name: json['name'] as String,
      img: json['img'] as String,
      username: json['username'] as String);
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'username': instance.username
    };
