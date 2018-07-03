import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/list.dart';

class FirstPage extends StatefulWidget {
  @override
  createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
  
      body: new Container(
        child: new List(),
      )
    );
  }
}
