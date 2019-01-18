import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/testList.dart';
class SecPage extends StatefulWidget {
  @override
  createState() => new SecPageState();
}

class SecPageState extends State<SecPage> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        title:new Center(
          child: new Text('发现'),         
        )
      ),
      body: new Center(
        child: new HomeList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
