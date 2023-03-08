import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/api_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ApiResponseEntity {

	dynamic data;
	int? errorCode;
	String? errorMsg;
  
  ApiResponseEntity();

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  ApiResponseEntity copyWith({dynamic data, int? errorCode, String? errorMsg}) {
      return ApiResponseEntity()..data= data ?? this.data
			..errorCode= errorCode ?? this.errorCode
			..errorMsg= errorMsg ?? this.errorMsg;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

