import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  static const LOGO = "images/profile_header.png";

  var _userNameController = new TextEditingController();
  var _userPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var leftRightPadding = 30.0;
    var topBottomPadding = 4.0;
    //var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
    var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('登录'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child:  new Image.asset(LOGO),                    
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
            child: new TextField(
              style: hintTips,
              controller: _userNameController,
              decoration: new InputDecoration(hintText: "请输入用户名"),
              obscureText: false,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: new TextField(
              style: hintTips,
              controller: _userPassController,
              decoration: new InputDecoration(hintText: "请输入用户密码"),
              obscureText: true,
            ),
          ),
          new Container(
            width: 360.0,
            margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
            padding: new EdgeInsets.fromLTRB(leftRightPadding, topBottomPadding,
                leftRightPadding, topBottomPadding),
            child: new Card(
              color: Colors.green,
              elevation: 6.0,
              child: new FlatButton(
                  onPressed: () {
                    print("the pass is" + _userNameController.text);
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text(
                      '马上登录',
                      style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
