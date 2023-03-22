import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test01/httpUtils/ApiException.dart';
import 'package:test01/httpUtils/apis.dart';
import 'package:test01/httpUtils/httpclient.dart';
import 'package:test01/model/api_response_entity.dart';
import 'package:test01/model/article_list_item_entity.dart';
import 'package:test01/model/article_list_result_entity.dart';
import 'package:test01/model/banner_bean_entity.dart';
import 'package:test01/Widgets/homelistcell.dart';
class Homepage extends StatefulWidget {
  // TODO: add state variables, methods and constructor params
  const Homepage({Key? key}) : super(key: key);

  State<Homepage> createState() => _MyHomePageState();

// ListView(controller: _scrollController, children: _buildList())
}

class _MyHomePageState extends State<Homepage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<BannerBeanEntity>? bannerEntity;
  ArticleListResultEntity? articleResultList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    getData();
  }

//  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("setState");
  }

  void getData() async {
    print("getData");
    bannerEntity =
        (await HttpClient().get<List<BannerBeanEntity>>(Apis.getbannerList));
    articleResultList = (await HttpClient().get<ArticleListResultEntity>(
        (Apis.getArticleList + '/0/json'),
        onError: (apiException) {print(apiException.message);return false;}));
    setState(() {});
    print("setState done");
    // print(articleResultList);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    print("build  bannerEntity.size==${bannerEntity?.length}");
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text("首页"),
          backgroundColor: Colors.white,
          trailing: Padding(
            padding: EdgeInsets.all(0.5),
            child: TextButton(
              // child: Image.asset("assets/images/upgrade.png"),
              child: Icon(CupertinoIcons.search),
              //autofocus:false ,
              onPressed: () {
                print("press");
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
              ),
            ),
          )),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(
          complete: Center(
            child: Text("加载完成",
                style: TextStyle(fontSize: 12, color: Colors.black)),
          ),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 15.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: _onLoading,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper(
                  autoplay: true,
                  itemCount: 3,
                  indicatorLayout: PageIndicatorLayout.SCALE,
                  pagination: SwiperPagination(builder: SwiperPagination.dots),
                  itemBuilder: (BuildContext context, int index) {
                    // return (bannerEntity?.length != 3) ?? false
                    //     ? Image.asset("assets/images/ic_head.jpeg")
                    //     : CachedNetworkImage(
                    //     imageUrl: (bannerEntity?[index])?.imagePath ?? "assets/images/ic_head.jpeg",
                    //     placeholder: (context, url) =>
                    //         Image.asset("assets/images/ic_head.jpeg"),);
                    return (bannerEntity?.length != 3) ?? false
                        ? Image.asset("assets/images/ic_head.jpeg")
                        : Image.network((bannerEntity?[index])?.imagePath ??
                            "assets/images/ic_head.jpeg");
                  },
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (articleResultList != null) {
                   ArticleListItemEntity model =
                      articleResultList?.datas?[index] as ArticleListItemEntity;
                  return Homelistcell(model,(_){print("set");});
                } else {
                  return Container();
                }
              },
              childCount: articleResultList?.datas?.length ?? 1,
            )),
          ],
        ),
      ),
    );
  }

  void onRefresh() async {
    print("onRefresh");
    // await Future.delayed(Duration(milliseconds: 1000));
    String url = Apis.getArticleList + '/0/json';
    ApiResponseEntity<ArticleListResultEntity>? entity = await HttpClient()
        .get<ApiResponseEntity<ArticleListResultEntity>?>(url);
    // print(entity.data[0].toString());
    _refreshController.refreshCompleted();
    print(bannerEntity);
  }

  void _onLoading() async {
    // await Future.delayed(Duration(milliseconds: 1000));
    // items.add((items.length + 1).toString());
    // if (mounted) setState(() {});
    // _refreshController.loadComplete();
  }

  Widget _item(city) {
    // return Container(
    //   height: 80,
    //   margin: EdgeInsets.only(bottom: 6, right: 6),
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(color: Colors.teal),
    //   child: Text(city, style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
    return Card(child: Center(child: Text(city)));
  }
}
