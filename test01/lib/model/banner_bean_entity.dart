import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/banner_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BannerBeanEntity {

	String? desc;
	int? id;
	String? imagePath;
	int? isVisible;
	int? order;
	String? title;
	int? type;
	String? url;
  
  BannerBeanEntity();

  factory BannerBeanEntity.fromJson(Map<String, dynamic> json) => $BannerBeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $BannerBeanEntityToJson(this);

  BannerBeanEntity copyWith({String? desc, int? id, String? imagePath, int? isVisible, int? order, String? title, int? type, String? url}) {
      return BannerBeanEntity()..desc= desc ?? this.desc
			..id= id ?? this.id
			..imagePath= imagePath ?? this.imagePath
			..isVisible= isVisible ?? this.isVisible
			..order= order ?? this.order
			..title= title ?? this.title
			..type= type ?? this.type
			..url= url ?? this.url;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}