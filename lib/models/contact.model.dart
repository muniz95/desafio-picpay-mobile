import 'package:json_annotation/json_annotation.dart';

part 'contact.model.g.dart';

@JsonSerializable()
class Contact {
  final int id;
  final String name;
  final String img;
  final String username;

  Contact({this.id, this.name, this.img, this.username});

  static fromJsonStatic(Map<String, dynamic> json) => _$ContactFromJson(json);
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}