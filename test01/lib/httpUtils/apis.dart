class Apis{

  /// 初始化方法私有化
  Apis._();
  // baseUrl
  static const String baseUrl = 'https://www.wanandroid.com/';

  // 首页文章列表
  static const String getArticleList = '/article/list';

  static const String getbannerList = '/banner/json';

  // 项目分类
  static const String getProjectClassify = '/project/tree/json';

}