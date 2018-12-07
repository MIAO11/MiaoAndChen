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

  void initState() {
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
        } else {
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
                            '哈哈',
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

  
}
