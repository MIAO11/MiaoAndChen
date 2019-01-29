import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manhua/util/CommonUtils.dart';
import 'package:manhua/util/redux/MkState.dart';
import 'package:manhua/views/TsPage.dart';
import 'package:manhua/views/XsDetail.dart';

class FirstPage extends StatefulWidget {
  @override
  createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: new StoreBuilder<MkState>(builder: (context, store) {
      return new Scaffold(
          appBar: new AppBar(
              title: new Center(
            child: new Text('首页'),
          )),
          body: new RotatedBox(
              quarterTurns: 4,
              // height: .0,
              child: Card(
                  child: new Column(children: [
                new ListTile(
                  title: new Text('唐诗',
                      style: new TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: new Text('唐朝'),
                  leading: new Icon(
                    Icons.business,
                    color: Colors.blue[500],
                  ),
                  onTap: () => toTsPage(),
                ),
                new Divider(),
                new ListTile(
                  title: new Text('小说',
                      style: new TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: new Text('小说在线阅读'),
                  leading: new Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                  onTap: () => toXsPage(),
                ),
                new Divider(),
                new ListTile(
                  title: new Text('夜间模式点我',
                      style: new TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: new Text('点我'),
                  leading: new Icon(
                    Icons.contact_mail,
                    color: Colors.blue[500],
                  ),
                  onTap: () => switchTheme(context, store),
                ),
                new Divider(),
              ]))));
    }));
  }

  void toTsPage() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new TsPage()));
  }

  void toXsPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new XsDetailPage()));
  }

  //切换夜间模式
  void switchTheme(context, store) {
    var list = ['白天', '夜间'];
    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.pushTheme(store, index);
      //LocalStorage.save(Config.THEME_COLOR, index.toString());
    }, colorList: CommonUtils.getThemeListColor());
  }
}
