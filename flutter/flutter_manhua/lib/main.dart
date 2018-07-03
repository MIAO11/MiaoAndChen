// Step 7 (Final): Change the app's theme
import 'package:flutter/material.dart';
import './views/firstPage.dart';
import './views/secPage.dart';
import './views/thirdPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> with SingleTickerProviderStateMixin{
  TabController tabController;

  void initState() {
    tabController = new TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: 
      new TabBarView(
        controller: tabController,
        children: <Widget>[new FirstPage(), new SecPage(), new ThirdPage()],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          controller: tabController,
          tabs: <Tab>[
            new Tab(
              text: '今日',
              icon: new Icon(Icons.home),
            ),
            new Tab(
              text: '发现',
              icon: new Icon(Icons.menu),
            ),
            new Tab(
              text: '分类',
              icon: new Icon(Icons.cloud_queue),
            ),
          ],
        )
      )
    );
  }
}