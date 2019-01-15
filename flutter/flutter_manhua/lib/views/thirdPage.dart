import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manhua/http/Constants.dart';
import 'package:manhua/http/HttpService.dart';
import 'package:manhua/views/DtDetail.dart';
import 'package:manhua/util/Util.dart';

class ThirdPage extends StatefulWidget {
  @override
  createState() => new ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('电台'),
        ),
      ),
      body: new DtPage(),
    );
  }
}

class DtPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GridViewState();
}

class GridViewState extends State {
  var resultList = [];
  var channellist = [];
  var channel = [];
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8.0),
        mainAxisSpacing: 10.0, //竖向间距
        crossAxisCount: 2, //横向Item的个数
        crossAxisSpacing: 8.0, //横向间距
        children: buildGridTileList());
  }

  List<Widget> buildGridTileList() {
    List<Widget> widgetList = new List();
    print(channel.length);
    for (int i = 0; i < channel.length; i++) {
      widgetList.add(getItemWidget(channel[i]));
    }
    return widgetList;
  }

  String url =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
      "3408544765&fm=27&gp=0.jpg";
  Widget getItemWidget(channel) {
    //BoxFit 可设置展示图片时 的填充方式
    return GestureDetector(
      child: Card(
        child: new Column(
          children: <Widget>[
            Image(
              height: 140.0,
              image: new CachedNetworkImageProvider(channel['thumb']),
              fit: BoxFit.fitWidth,
            ),
            Center(
              child: Text(channel['name']),
            ),
          ],
        ),
      ),
      onTap: () => _toDetail(channel['channelid']),
    );
    //return new Image(image: new NetworkImage(url), fit: BoxFit.cover);
  }

  getData() async {
    HttpService.get(Constants.DtUrl, (res) {
      resultList = jsonDecode(res)['result'];
      if (resultList.length > 0) {
        setState(() {
          channellist = resultList;
          channel = resultList[0]['channellist'];
        });
      }
    }, params: null);
  }

  void _toDetail(String channelid) {
    Util.showToast('点击我了', context);
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new DtDetailPage(channelid: channelid)));
  }
}
