import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:manhua/http/Constants.dart';
import 'package:manhua/http/HttpService.dart';


class XsDetailPage extends StatelessWidget {
  var result;
  var channelid;
  XsDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    channelid = channelid;
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('小说'),
      ),
      body:new WebviewScaffold(
          url: "http://t.shuqi.com/route.php?pagename=#!/ct/defaultin",
          // appBar: new AppBar(
          //   title: new Text("Widget webview"),
          // ),
        ), 
    );
  }
  
  getData() {
    HttpService.get(Constants.DtUrl, (res) {
      result = jsonDecode(res)['result'];  
      print('');     
      print(result);     
    }, params: null);
  }

}

