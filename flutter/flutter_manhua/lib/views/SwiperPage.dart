import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../http/HttpService.dart';
import 'dart:convert';
import '../http/Constants.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  var galleryItems = [];
  void initState() {
    HttpService.get(Constants.HomeTjUrl, (res){
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      galleryItems=returnData['galleryItems'];
      print(galleryItems.toString());
       setState(() {
        galleryItems = galleryItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:new Center(
          child: new Text('发现'),         
        )
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: galleryItems.length,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
            control: new SwiperControl(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) =>goDetail(index)                 
          ),
          ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      galleryItems[index]['cover'],
      fit: BoxFit.fill,
    ));
  }
  goDetail(int index){
    print(galleryItems[index]);
  }
}