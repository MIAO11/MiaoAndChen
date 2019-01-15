import 'package:flutter/material.dart';
import 'package:manhua/views/DtDetail.dart';
import './views/firstPage.dart';
import './views/secPage.dart';
import './views/thirdPage.dart';
import './views/MyPage.dart';
import './views/Detail.dart';
import 'package:flutter/rendering.dart';

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
      '/detail':(BuildContext context)=>new DetailPage(params:{}),
      '/dtdetail':(BuildContext context)=>new DtDetailPage(channelid:''),
    },)
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin{
  PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.pageController = PageController(initialPage: this.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("唐诗"),
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
        fixedColor: Colors.green,
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

  @override
  bool get wantKeepAlive => true;
}
