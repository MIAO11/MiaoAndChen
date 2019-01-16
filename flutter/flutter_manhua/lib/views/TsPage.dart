import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/list.dart';

class TsPage extends StatefulWidget {
  @override
  createState() => new TsPageState();
}

class TsPageState extends State<TsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        centerTitle: true,
        title: new Text('唐诗'),                
      ),
      body:new List()
    );
  }

}