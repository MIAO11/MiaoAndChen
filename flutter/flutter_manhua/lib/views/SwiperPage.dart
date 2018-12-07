import 'package:flutter/material.dart';
import '../components/HomeList.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {

  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: new Center(
          child: new Text('发现'),
        )),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: new HomeList()));
  }




}
