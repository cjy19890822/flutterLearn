import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/test_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TestEntity {

	String? name;
  
  TestEntity();

  factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

  Map<String, dynamic> toJson() => $TestEntityToJson(this);

  TestEntity copyWith({String? name}) {
      return TestEntity()..name= name ?? this.name;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}