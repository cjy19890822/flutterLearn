import 'package:test01/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:test01/generated/json/base/json_convert_content.dart';


class ApiResponseEntity<T> {

	T? data;
	int? errorCode;
	String? errorMsg;
  
  ApiResponseEntity();

  factory ApiResponseEntity.fromJson(Map <String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  ApiResponseEntity copyWith({T? data, int? errorCode, String? errorMsg}) {
      return ApiResponseEntity()..data= data ?? this.data
			..errorCode= errorCode ?? this.errorCode
			..errorMsg= errorMsg ?? this.errorMsg;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
  final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity();
  final T? data = jsonConvert.convert<T>(json['data']);
  if (data != null) {
    apiResponseEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    apiResponseEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    apiResponseEntity.errorMsg = errorMsg;
  }
  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

