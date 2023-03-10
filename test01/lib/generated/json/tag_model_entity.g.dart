import 'package:test01/generated/json/base/json_convert_content.dart';
import 'package:test01/model/tag_model_entity.dart';

TagModelEntity $TagModelEntityFromJson(Map<String, dynamic> json) {
	final TagModelEntity tagModelEntity = TagModelEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tagModelEntity.name = name;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		tagModelEntity.url = url;
	}
	return tagModelEntity;
}

Map<String, dynamic> $TagModelEntityToJson(TagModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}