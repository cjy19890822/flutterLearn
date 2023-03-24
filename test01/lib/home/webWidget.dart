import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebWidget extends StatelessWidget {
  // TODO: add state variables, methods and constructor params
  String url;

  WebWidget(this.url);

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    InAppWebViewController _webViewController;
    double progress = 0;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(url,style: TextStyle(fontSize: 15),),leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios_new),
        onTap: ()=>Navigator.pop(context),
      ) ),
        child:  Container(
        child: Column(children: <Widget>[

          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(url)),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      //debu: true,
                    )
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },

              ),
            ),
          ),

        ])));

  }
}


