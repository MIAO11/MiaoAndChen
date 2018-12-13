import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThirdPage extends StatefulWidget {
  @override
  createState() => new ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('分类'),
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //对齐方式：平均间隔
          children: <Widget>[
            new CupertinoButton(
                color: Colors.blue,
                child: new Text('点我'),
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "点我也没用",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      bgcolor: "#000000",
                      textcolor: '#ffffff');
                }),
            new Text("嗯哼")
          ],
        ),
      ),
    );
  }
}
