import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String id;
  DetailPage(this.id);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        centerTitle:true,
        title:new Text('详情'),          
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //对齐方式：平均间隔
          children: <Widget>[
            new CupertinoButton(
                color: Colors.blue,
                child: new Text('返回第一个页面'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new Text("第一个页面传过来的值为：" + id)
          ],
        ),
      ),
    );
  }
}
