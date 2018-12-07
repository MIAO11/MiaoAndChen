import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../http/HttpService.dart';
import 'dart:convert';
import '../http/Constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<BannerWidget> {
 var galleryItems = [];

  void initState() {
    HttpService.get(Constants.HomeTjUrl, (res){
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      galleryItems=returnData['comicLists'];
      print(galleryItems.toString());
       setState(() {
        galleryItems = galleryItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: 3,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
            control: new SwiperControl(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) =>print('点击了第$index个')                  
          ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      // galleryItems[index]['cover'],
      "https://photo.16pic.com/00/04/73/16pic_473516_b.jpg",
      fit: BoxFit.fill,
    ));
  }
}