import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../http/HttpService.dart';
import 'dart:convert';
import '../http/Constants.dart';

class HomeList extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<HomeList> {
  var comicLists = [];
  var galleryItems = [];
  ScrollController _scrollController = ScrollController();
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  Future getData() async {
    HttpService.get(Constants.HomeTjUrl, (res) {
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      comicLists = returnData['comicLists'];
      galleryItems = returnData['galleryItems'];
      setState(() {
        comicLists = comicLists;
        comicLists.insert(0, {});
        galleryItems = galleryItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _biggerFont = const TextStyle(fontSize: 18.0);
    return new ListView.builder(
      itemCount: comicLists == null ? 0 : comicLists.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return new Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: new Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: galleryItems.length > 0 ? galleryItems.length : 1,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white,
                )),
                // control: new SwiperControl(),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => goDetail(index)),
          );
        } else if(index<comicLists.length-1) {
          return new Card(
              child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: [
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new Text(
                              comicLists[index]["itemTitle"] != Null
                                  ? comicLists[index - 1]["itemTitle"]
                                      .toString()
                                  : "无",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          new Text(
                            index.toString(),
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Icon(
                      Icons.star,
                      color: Colors.red[500],
                    ),
                    new Text('41'),
                  ],
                ),
              ],
            ),
          ));
        }else{
          print('加载更多页面');
          return _getMoreWidget();
        }
      },
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    if (galleryItems.length > 0) {
      //判断网络数据是否有数据
      return (new Image(
        image: new CachedNetworkImageProvider(galleryItems[index]['cover']),
        fit: BoxFit.fill,
      ));
    }
  }

  goDetail(int index) {
    print(galleryItems[index]);
  }

  /*
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _getMore() async {
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});
    comicLists.add({});

    setState(() {
      comicLists = comicLists;
    });
  }


  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
