import 'package:flutter/material.dart';
import 'package:test01/Home/MainPage.dart';
import 'package:flutter/cupertino.dart';
//import 'package:project01/main.dart';
class WelcomePage extends StatelessWidget {
  // TODO: add state variables, methods and constructor params
  WelcomePage();

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    return Scaffold(
      body:PageView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,

        children: [
          Container(
            width: 200,
            child: _welcomeView("welcome_2.png", false,context),
          ),
          Container(
            width: 200,
            child: _welcomeView("welcome_1.png", true,context),
          ),
        ],
      ),
    );
  }

  Widget _welcomeView(String imageName , bool visible,BuildContext context){
    return  Stack(
      //alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$imageName"),
                  fit: BoxFit.fitHeight,
              ),

            ) ,
          ),
          Visibility(
            visible: visible,
            child: Positioned(
              left: 20,
              right: 20,
              bottom: 44,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                child: const Text("点击进入"),
                onPressed: () {
                 // AccountManager().saveNotFirstLaunch();
                 // Get.offAllNamed(Routes.main);
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>MainPage()));
                },
              ),
            ),
          )
        ],
    );
  }
}
