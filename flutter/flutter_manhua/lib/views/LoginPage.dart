import 'package:flutter/material.dart';
import 'package:manhua/http/Constants.dart';
import 'package:manhua/http/HttpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}



class LoginPageState extends State<LoginPage>with TickerProviderStateMixin {
  static const LOGO = "images/profile_header.png";

  AnimationController controller_record;
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);
  var _userNameController = new TextEditingController();
  var _userPassController = new TextEditingController();
  Animation<double> animation_record;
  Animation<double> animation_needle;

    @override
  void initState() {
    super.initState();
    controller_record = new AnimationController(
        duration: const Duration(milliseconds: 15000),vsync:this);
    animation_record =
        new CurvedAnimation(parent: controller_record, curve: Curves.linear);
    animation_record.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller_record.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller_record.forward();
      }
    });
    controller_record.forward();
    init();
    


  }
  // shared_preferences 用法
  void init () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get('userName'));
    _userNameController.text = prefs.get('userName');
  }

  @override
  Widget build(BuildContext context) {
    var leftRightPadding = 30.0;
    var topBottomPadding = 4.0;
    //var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
    var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
    var params={'username':'','password':''};
    
    return new Scaffold(
      // primary: false,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('登录'),
      ),
      body: Stack(
      children: <Widget>[
        Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                 image: AssetImage('images/test.jpg'),
                 fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.overlay)
              )
            ),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[  
          new Padding(
            padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child:  
              Container(
                // width: 120.0,
                // height: 120.0,              
                // child:  new Image.asset(LOGO),
                child: new RotateRecord(
                  animation: _commonTween.animate(controller_record),               
                ),
              )                              
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
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('userName',_userNameController.text);
                    params['username'] = _userNameController.text;
                    params['password'] = _userPassController.text;
                    HttpService.post(Constants.LoginUrl, (res) {
                      prefs.setString('userInfo', res);
                      prefs.setBool('isLogin', true);
                      prefs.setBool('isLogin', true);                                               
                    },params: params);
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text(
                      '马上登录',
                      style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
            ),
          ),
        ],       
      ),
      ),
      ],     
    )
    );
  }
}
class RotateRecord extends AnimatedWidget {
  RotateRecord({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: 250.0,
      width: 250.0,
      child: new RotationTransition(
          turns: animation,
          child: new Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://images-na.ssl-images-amazon.com/images/I/51inO4DBH0L._SS500.jpg"),
              ),
            ),
          )),
    );
  }
}

