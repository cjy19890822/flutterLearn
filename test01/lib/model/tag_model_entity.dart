import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/tag_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TagModelEntity {

	String? name;
	String? url;
  
  TagModelEntity();

  factory TagModelEntity.fromJson(Map<String, dynamic> json) => $TagModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $TagModelEntityToJson(this);

  TagModelEntity copyWith({String? name, String? url}) {
      return TagModelEntity()..name= name ?? this.name
			..url= url ?? this.url;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}