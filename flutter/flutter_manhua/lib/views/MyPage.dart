import 'package:flutter/material.dart';
import 'package:manhua/views/LoginPage.dart';

abstract class ProfileModel {}

class ProfileData extends ProfileModel {
  var assetName;
  var title;
  ProfileData({this.assetName, this.title});
}

class ProfileLine extends ProfileModel {}

final datas = [
  ProfileData(assetName: "images/profile_rss.png", title: "我的VIP"),
  ProfileLine(),
  ProfileData(assetName: "images/profile_rss.png", title: "我的订阅"),
  ProfileData(assetName: "images/profile_rss.png", title: "我的封印图"),
  ProfileData(assetName: "images/profile_rss.png", title: "我的优惠券"),
  ProfileLine(),
  ProfileData(assetName: "images/profile_rss.png", title: "腰果商城"),
  ProfileData(assetName: "images/profile_rss.png", title: "流量包"),
  ProfileData(assetName: "images/profile_rss.png", title: "首都网警"),
  ProfileLine(),
  ProfileData(assetName: "images/profile_rss.png", title: "帮助中心"),
  ProfileData(assetName: "images/profile_rss.png", title: "我要反馈"),
  ProfileData(assetName: "images/profile_rss.png", title: "请赐予我评分"),
  ProfileData(assetName: "images/profile_rss.png", title: "成为作者"),
  ProfileLine(),
  ProfileData(assetName: "images/profile_rss.png", title: "设置"),
];

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 0.0),
        itemCount: datas.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _generatorProfileHeaderWidget(context);
          } else {
            final model = datas[index - 1];
            if (model is ProfileData) {
              return ListTile(
                leading: Container(
                  width: 30.0,
                  child: Image.asset(model.assetName),
                ),
                title: Text('${model.title}'),
              );
            } else {
              return Container(
                height: 1.0,
                color: Colors.grey[200],
              );
            }
          }
        },
      ),
    );
  }

  Widget _generatorProfileHeaderWidget(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 200.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 60.0,
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Image.asset("images/profile_header.png")),
                    Text('主人，戳我登录',
                        style: TextStyle(color: Colors.white, fontSize: 15.0))
                  ],
                ))
          ],
        ),
        Container(
          color: Colors.grey[200],
          height: 10.0,
        )
      ],
    ));
  }
}
