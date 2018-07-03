import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: new Text('分类'),
      ),
    );
  }
}
