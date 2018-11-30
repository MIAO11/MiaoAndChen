import 'package:flutter/material.dart';
import '../util/HttpUtil.dart';
import '../http/HttpService.dart';
import 'dart:convert';
import '../http/Constants.dart';


class homeList extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<homeList> {
  var comicLists = [];
  void initState() {
    HttpService.get(Constants.HomeTjUrl, (res){
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      comicLists=returnData['comicLists'];
       setState(() {
        comicLists = comicLists;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // final _biggerFont = const TextStyle(fontSize: 18.0);
    return new ListView.builder(
      itemCount: comicLists == null ? 0 : comicLists.length,
      itemBuilder: (BuildContext context, int index) {
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
                            comicLists[index]["itemTitle"]!=Null?comicLists[index]["itemTitle"].toString():"无",
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
      },
    );
  }
}
