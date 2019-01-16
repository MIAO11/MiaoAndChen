import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manhua/http/Constants.dart';
import 'package:manhua/http/HttpService.dart';
import 'package:manhua/views/player_page.dart';


String coverArt = 'https://ws1.sinaimg.cn/large/0065oQSqgy1fwyf0wr8hhj30ie0nhq6p.jpg',
    mp3Url = 'http://211.161.150.159/amobile.music.tc.qq.com/C4000049maM02t753u.m4a?guid=1935204060&vkey=B85E983981864D5E8875855324D924CAE632BBB30665ED7C823F1DCA8F9C0C9B7870CE33700CD09F45FE26BC72BA5E0C33EF63BFAA9FB00A&uin=8122&fromtag=66',
    mp3Url1 = 'http://211.161.150.159/amobile.music.tc.qq.com/C4000049maM02t753u.m4a?guid=1935204060&vkey=B85E983981864D5E8875855324D924CAE632BBB30665ED7C823F1DCA8F9C0C9B7870CE33700CD09F45FE26BC72BA5E0C33EF63BFAA9FB00A&uin=8122&fromtag=66';
final GlobalKey<PlayerState> musicPlayerKey = new GlobalKey();

class DtDetailPage extends StatefulWidget {
  var channelname;
  DtDetailPage({Key key, @required this.channelname}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    channelname=this.channelname;
    print(channelname);
    return new MusicState(channelname);
  } 
}
  
class MusicState extends State with TickerProviderStateMixin{
  var result; 
  var channelname;
  MusicState(this.channelname);
  @override
  void initState() {   
    super.initState();
    print(channelname);
    getData();
  }
 
  @override
  Widget build(BuildContext context) {
    channelname = channelname;
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('电台'),
      ),
      body:new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(coverArt),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.overlay)
              )
            ),
            child:new Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: new Player(
                  onError: (e) {
                    Scaffold.of(context).showSnackBar(
                      new SnackBar(
                        content: new Text(e),
                      ),
                    );
                  },
                  onPrevious: () {},
                  onNext: () {},
                  onCompleted: () {
                    coverArt = 'https://ws1.sinaimg.cn/large/0065oQSqgy1fy58bi1wlgj30sg10hguu.jpg';
                    mp3Url = mp3Url1;
                    setState(() {
                         coverArt=coverArt;
                         mp3Url = mp3Url;
                    });
                    print('唱完了');
                  },
                  onPlaying: (isPlaying) {
                    if (isPlaying) {
                      //controller_record.forward();
                     // controller_needle.forward();
                    } else {
                     // controller_record.stop(canceled: false);
                      //controller_needle.reverse();
                    }
                  },
                  key: musicPlayerKey,
                  color: Colors.blue,
                  audioUrl: mp3Url,
                ),
              ),
          ),
                   
        ],
      ), 
    );
  }
  getData() {
      HttpService.get(Constants.DtDegtailUrl, (res) {
        result = jsonDecode(res)['result'];  
        print('请求成功');     
        print(result);     
      }, params: {'channelname':channelname});
  }
  




}

