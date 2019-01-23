import 'package:flutter/material.dart';
import 'package:manhua/views/DtDetail.dart';
import 'package:manhua/views/LoginPage.dart';
import 'package:manhua/views/TsPage.dart';
import 'package:manhua/views/XsDetail.dart';
import './views/firstPage.dart';
import './views/secPage.dart';
import './views/thirdPage.dart';
import './views/MyPage.dart';
import './views/Detail.dart';
import 'package:flutter/rendering.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'dart:async';

void main() {
  //debugPaintSizeEnabled = true; 
  runApp(new MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      buttonColor: Colors.green,
      backgroundColor: Colors.grey[200],
      textTheme: TextTheme(
        display1: TextStyle(fontSize: 17.0, color: Colors.black),
        display2: TextStyle(fontSize: 13.0, color: Colors.grey),
        display3: TextStyle(fontSize: 23.0, color: Colors.black)
      ),
    ),
    routes: <String,WidgetBuilder>{
      '/loginpage':(BuildContext context)=>new LoginPage(),
      '/detail':(BuildContext context)=>new DetailPage(params:{}),
      '/xsdetail':(BuildContext context)=>new XsDetailPage(),
      '/dtdetail':(BuildContext context)=>new DtDetailPage(channelname:''),
      '/tspage':(BuildContext context)=>new TsPage(),
    },)
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  PageController pageController;
  int currentIndex = 0;
  final JPush jpush = new JPush();
  @override
  void initState() {
    super.initState();
    this.pageController = PageController(initialPage: this.currentIndex);
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    jpush.getRegistrationID().then((rid) {
      print(rid);
    });
    jpush.setup(
      appKey: "114311f50bb78a9fef2e86b1",
      channel: "theChannel",
      production: false,
      debug: true,
    );

    jpush.applyPushAuthority(new NotificationSettingsIOS(
      sound: false,
      alert: false,
      badge: false));
    try {     
      jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
         print("flutter onReceiveNotification: $message");
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");        
      },
      );
    } 
     on Exception {
       platformVersion = 'Failed to get platform version.';
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("发现"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text("电台"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我的"),
          ),
        ],
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (page) {
          pageController.jumpToPage(page);
        },
        currentIndex: this.currentIndex,
      ),
      body: PageView(
        children: <Widget>[
         new FirstPage(), new SecPage(), new ThirdPage(),
          new ProfileWidget()
        ],
        controller: this.pageController,
        onPageChanged: (index) {
          setState((){
            this.currentIndex = index;
          });
        },
      ),
    );
  }
}
