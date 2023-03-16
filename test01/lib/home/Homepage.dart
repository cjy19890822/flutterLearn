import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
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
        header: WaterDropHeader(
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
                    return Container(
                        color: ((index % 2) == 0 ? Colors.blue : Colors.red));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
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
