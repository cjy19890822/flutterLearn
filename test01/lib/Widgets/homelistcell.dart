//import 'dart:js';

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test01/model/article_list_item_entity.dart';

class Homelistcell extends StatelessWidget {
  final ArticleListItemEntity _entity;
  final ValueChanged<ArticleListItemEntity> _callTapCallback;

  // TODO: add state variables, methods and constructor params
  // Homelistcell({super.key});
  Homelistcell(this._entity, this._callTapCallback);

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    return InkWell(
     // splashColor: Colors.yellow,
      onTap: () {
        _callTapCallback(_entity);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 15),
        child: _getRow(),
      ),
    );
  }

  Widget _getRow() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            _imageView(),
            _contentView(),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _imageView() {
    return Visibility(
      visible: _entity.envelopePic?.isNotEmpty ?? false,
      child: SizedBox(
        width: 60,
        height: 60,
        child: _entity.envelopePic?.isEmpty ?? true
            ? Image.asset("assets/images/ic_head.jpeg")
            : CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: _entity.envelopePic ?? "",
                placeholder: (context, url) =>
                    Image.asset("assets/images/ic_head.jpeg"),
              ),
      ),
    );
  }

  Widget _contentView() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 15),
      child: Column(
        children: [
          SizedBox(
            width: window.physicalGeometry.width,
            child: Text(
              _entity.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16,color: Colors.black87),
            ),
          ),
          Container(
            height: 20,
          ),
          SizedBox(
            width: window.physicalGeometry.width,
            child: Text(
              _entity.author.toString(),

              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.right
            ),
          ),

          Container(
            //padding: const EdgeInsets.only(right: 0),
            width: window.physicalGeometry.width,
            // margin:const EdgeInsets.only(right: 10) ,
            child: Text(_entity.niceShareDate.toString(),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    ));
  }
}
