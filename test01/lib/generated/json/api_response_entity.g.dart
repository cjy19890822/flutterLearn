import 'package:test01/generated/json/base/json_convert_content.dart';
import 'package:test01/model/api_response_entity.dart';

ApiResponseEntity $ApiResponseEntityFromJson(Map<String, dynamic> json) {
	final ApiResponseEntity apiResponseEntity = ApiResponseEntity();
	final dynamic data = jsonConvert.convert<dynamic>(json['data']);
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
	data['data'] = entity.data;
	data['errorCode'] = entity.errorCode;
	data['errorMsg'] = entity.errorMsg;
	return data;
}