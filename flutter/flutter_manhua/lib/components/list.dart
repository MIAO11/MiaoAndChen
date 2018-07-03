import 'package:flutter/material.dart';
import 'dart:convert';
import '../http/Constants.dart';
import 'package:http/http.dart' as http;

class List extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<List> {
  var dayDataList = [];
  var _isFavorited = true;
  void initState() {
    http.read(Constants.HomeUrl).then((res) {
      Map data = JSON.decode(res)['data'];
      Map returnData = data['returnData'];
      dayDataList = returnData['dayDataList'];
      print(dayDataList);
      setState(() {
        dayDataList = dayDataList;
      });
    });
  }

  void onPressed(id) {
    print(id);
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _biggerFont = const TextStyle(fontSize: 18.0);
    return new ListView.builder(
      itemCount: dayDataList == null ? 0 : dayDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(

            //  onPressed: onPressed(dayDataList[index]["dayItemDataList"][0]['htmlId']),
            child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Center(
                    child: new Text(
                      dayDataList[index]["weekDay"],
                      style: _biggerFont,
                    ),
                  ),
                ],
              ),
              new Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[                
                  new Card(
                    child: new Image.network(
                        dayDataList[index]["dayItemDataList"][0]['comicCover'],
                       // width: 140.0,
                        height: 460.0,
                        fit: BoxFit.cover,                
                        ),
                  ),
                  // new Container(
                  //   child: new Text('data'),
                  // ),
                ],
              ),
            ],
          ),
        ));
      },
    );
  }
}
