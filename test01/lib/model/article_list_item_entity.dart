import 'package:test01/generated/json/base/json_field.dart';
import 'package:test01/generated/json/article_list_item_entity.g.dart';
import 'dart:convert';
import 'package:test01/model/tag_model_entity.dart';
@JsonSerializable()
class ArticleListItemEntity {

	bool? adminAdd;
	String? apkLink;
	int? audit;
	String? author;
	bool? canEdit;
	int? chapterId;
	String? chapterName;
	bool? collect;
	int? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	int? id;
	bool? isAdminAdd;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	int? publishTime;
	int? realSuperChapterId;
	bool? route;
	int? selfVisible;
	int? shareDate;
	String? shareUser;
	int? superChapterId;
	String? superChapterName;
	List<TagModelEntity>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  ArticleListItemEntity();

  factory ArticleListItemEntity.fromJson(Map<String, dynamic> json) => $ArticleListItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleListItemEntityToJson(this);

  ArticleListItemEntity copyWith({bool? adminAdd, String? apkLink, int? audit, String? author, bool? canEdit, int? chapterId, String? chapterName, bool? collect, int? courseId, String? desc, String? descMd, String? envelopePic, bool? fresh, String? host, int? id, bool? isAdminAdd, String? link, String? niceDate, String? niceShareDate, String? origin, String? prefix, String? projectLink, int? publishTime, int? realSuperChapterId, bool? route, int? selfVisible, int? shareDate, String? shareUser, int? superChapterId, String? superChapterName, List<TagModelEntity>? tags, String? title, int? type, int? userId, int? visible, int? zan}) {
      return ArticleListItemEntity()..adminAdd= adminAdd ?? this.adminAdd
			..apkLink= apkLink ?? this.apkLink
			..audit= audit ?? this.audit
			..author= author ?? this.author
			..canEdit= canEdit ?? this.canEdit
			..chapterId= chapterId ?? this.chapterId
			..chapterName= chapterName ?? this.chapterName
			..collect= collect ?? this.collect
			..courseId= courseId ?? this.courseId
			..desc= desc ?? this.desc
			..descMd= descMd ?? this.descMd
			..envelopePic= envelopePic ?? this.envelopePic
			..fresh= fresh ?? this.fresh
			..host= host ?? this.host
			..id= id ?? this.id
			..isAdminAdd= isAdminAdd ?? this.isAdminAdd
			..link= link ?? this.link
			..niceDate= niceDate ?? this.niceDate
			..niceShareDate= niceShareDate ?? this.niceShareDate
			..origin= origin ?? this.origin
			..prefix= prefix ?? this.prefix
			..projectLink= projectLink ?? this.projectLink
			..publishTime= publishTime ?? this.publishTime
			..realSuperChapterId= realSuperChapterId ?? this.realSuperChapterId
			..route= route ?? this.route
			..selfVisible= selfVisible ?? this.selfVisible
			..shareDate= shareDate ?? this.shareDate
			..shareUser= shareUser ?? this.shareUser
			..superChapterId= superChapterId ?? this.superChapterId
			..superChapterName= superChapterName ?? this.superChapterName
			..tags= tags ?? this.tags
			..title= title ?? this.title
			..type= type ?? this.type
			..userId= userId ?? this.userId
			..visible= visible ?? this.visible
			..zan= zan ?? this.zan;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}