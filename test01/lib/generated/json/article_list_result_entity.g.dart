import 'package:test01/generated/json/base/json_convert_content.dart';
import 'package:test01/model/article_list_result_entity.dart';
import 'package:test01/model/article_list_item_entity.dart';


ArticleListResultEntity $ArticleListResultEntityFromJson(Map<String, dynamic> json) {
	final ArticleListResultEntity articleListResultEntity = ArticleListResultEntity();
	final int? curPage = jsonConvert.convert<int>(json['curPage']);
	if (curPage != null) {
		articleListResultEntity.curPage = curPage;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		articleListResultEntity.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		articleListResultEntity.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		articleListResultEntity.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		articleListResultEntity.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		articleListResultEntity.total = total;
	}
	final List<ArticleListItemEntity>? datas = jsonConvert.convertListNotNull<ArticleListItemEntity>(json['datas']);
	if (datas != null) {
		articleListResultEntity.datas = datas;
	}
	return articleListResultEntity;
}

Map<String, dynamic> $ArticleListResultEntityToJson(ArticleListResultEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['curPage'] = entity.curPage;
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	data['datas'] =  entity.datas?.map((v) => v.toJson()).toList();
	return data;
}