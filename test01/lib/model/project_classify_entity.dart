import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/project_classify_entity.g.dart';
import 'dart:convert';


@JsonSerializable()
class ProjectClassifyData {
	String? author;
	int? courseId;
	String? cover;
	String? desc;
	int? id;
	String? lisense;
	String? lisenseLink;
	String? name;
	int? order;
	int? parentChapterId;
	int? type;
	bool? userControlSetTop;
	int? visible;

	ProjectClassifyData();

	factory ProjectClassifyData.fromJson(Map<String, dynamic> json) => $ProjectClassifyDataFromJson(json);

	Map<String, dynamic> toJson() => $ProjectClassifyDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}