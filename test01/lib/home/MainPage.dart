import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test01/ProjectPage/projectPage.dart';
import 'package:test01/launch/WelcomePage.dart';
import 'package:test01/home/Homepage.dart';
class MainPage extends StatelessWidget {
  // TODO: add state variables, methods and constructor params
  MainPage();
  CupertinoTabController tabController =  CupertinoTabController();
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: items),
        controller: tabController,
        tabBuilder:(context,index){
          final type = MainTagType.values[index];
          return CupertinoTabView(builder: (context){
              return type.page;
          });
        },
   );
  }
  }



  enum MainTagType { home, project, publicNumber, tree, my }



List<BottomNavigationBarItem> get items {
    return MainTagType.values
        .map(
          (type) => BottomNavigationBarItem(
        icon: Icon(type.icon),
        label: type.title,
      ),
    ).toList();
  }

 extension MainTagTypeExt on MainTagType {
  IconData get icon {
    switch (this) {
      case MainTagType.home:
        return Icons.home;
      case MainTagType.project:
        return Icons.web;
      case MainTagType.publicNumber:
        return Icons.public;
      case MainTagType.tree:
        return Icons.list;
      case MainTagType.my:
        return Icons.person;
    }
  }

  String get title {
    switch (this) {
      case MainTagType.home:
        return "首页";
      case MainTagType.project:
        return "项目";
      case MainTagType.publicNumber:
        return "公众号";
      case MainTagType.tree:
        return "体系";
      case MainTagType.my:
        return "我的";
    }
  }

  Widget get page {
    switch (this) {
      case MainTagType.home:
        return  Homepage();
      case MainTagType.project:
        return  ProjectPage();
      case MainTagType.publicNumber:
        return  WelcomePage();
      case MainTagType.tree:
        return  WelcomePage();
      case MainTagType.my:
        return  WelcomePage();
    }
  }
}
