import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/article_list_result_entity.g.dart';
import 'dart:convert';
import 'package:test01/model/article_list_item_entity.dart';
@JsonSerializable()
class ArticleListResultEntity {

	int? curPage;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
	List<ArticleListItemEntity>? datas;
  
  ArticleListResultEntity();

  factory ArticleListResultEntity.fromJson(Map<String, dynamic> json) => $ArticleListResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleListResultEntityToJson(this);

  ArticleListResultEntity copyWith({int? curPage, int? offset, bool? over, int? pageCount, int? size, int? total,List<ArticleListItemEntity>? datas}) {
      return ArticleListResultEntity()..curPage= curPage ?? this.curPage
			..offset= offset ?? this.offset
			..over= over ?? this.over
			..pageCount= pageCount ?? this.pageCount
			..size= size ?? this.size
			..total= total ?? this.total..datas=datas??this.datas;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}