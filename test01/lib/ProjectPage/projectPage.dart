import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test01/ProjectPage/TabListPage.dart';
import 'package:test01/httpUtils/apis.dart';
import 'package:test01/httpUtils/httpclient.dart';
import 'package:test01/model/project_classify_entity.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State <ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin {
  // TODO: add state variables and methods
  late TabController _tabbarController;
  late  List<ProjectClassifyData> data;
  late  List<Article> data;

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    TabController _tabController = TabController(
        length: data?.length ?? 0, vsync: this);
    return CupertinoPageScaffold(
        navigationBar:CupertinoNavigationBar(
          middle: MaterialApp(

            home: TabBar(

              controller: _tabController,

              tabs: (data??[]).map((e) =>
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(e.name.toString()),
                    ),
                  ),
              ).toList(),
              isScrollable: true,
              labelColor: Colors.black,

            ),
            debugShowCheckedModeBanner: false,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: _createProjectPage(),
        ),


    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabbarController = TabController(length: 4, vsync: this, initialIndex: 1);
    getData();
  }

  getData() async {
    data = (await HttpClient().get<List<ProjectClassifyData>>(
        Apis.getProjectClassify))!;
    //print(data);
  }

  List<Widget> _createProjectPage(){
      return (data??[]).map((model){
        return TabListPage(

        );
      });
  }


}

