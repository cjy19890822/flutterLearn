import 'package:test01/generated/json/base/json_convert_content.dart';
import 'package:test01/model/project_classify_entity.dart';

ProjectClassifyData $ProjectClassifyDataFromJson(Map<String, dynamic> json) {
	final ProjectClassifyData projectClassifyData = ProjectClassifyData();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		projectClassifyData.author = author;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		projectClassifyData.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		projectClassifyData.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		projectClassifyData.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		projectClassifyData.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		projectClassifyData.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		projectClassifyData.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		projectClassifyData.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		projectClassifyData.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		projectClassifyData.parentChapterId = parentChapterId;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		projectClassifyData.type = type;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		projectClassifyData.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		projectClassifyData.visible = visible;
	}
	return projectClassifyData;
}

Map<String, dynamic> $ProjectClassifyDataToJson(ProjectClassifyData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['courseId'] = entity.courseId;
	data['cover'] = entity.cover;
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['lisense'] = entity.lisense;
	data['lisenseLink'] = entity.lisenseLink;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['type'] = entity.type;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}