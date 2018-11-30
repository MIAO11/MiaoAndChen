import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/homelist.dart';
class SecPage extends StatefulWidget {
  @override
  createState() => new SecPageState();
}

class SecPageState extends State<SecPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:new Center(
          child: new Text('排行榜'),         
        )
      ),
      body: new Center(
        child: new homeList(),
      ),
    );
  }
}
