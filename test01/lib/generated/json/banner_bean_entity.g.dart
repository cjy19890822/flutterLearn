import 'package:test01/generated/json/base/json_convert_content.dart';
import 'package:test01/model/banner_bean_entity.dart';

BannerBeanEntity $BannerBeanEntityFromJson(Map<String, dynamic> json) {
	final BannerBeanEntity bannerBeanEntity = BannerBeanEntity();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		bannerBeanEntity.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		bannerBeanEntity.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		bannerBeanEntity.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		bannerBeanEntity.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		bannerBeanEntity.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bannerBeanEntity.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		bannerBeanEntity.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		bannerBeanEntity.url = url;
	}
	return bannerBeanEntity;
}

Map<String, dynamic> $BannerBeanEntityToJson(BannerBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}