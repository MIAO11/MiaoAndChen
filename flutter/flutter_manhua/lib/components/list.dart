import 'package:flutter/material.dart';
import 'dart:convert';
import '../http/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../views/Detail.dart';

class List extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<List> {
  var dayDataList = [];
  var _isFavorited = true;

  void initState() {
    http.read(Constants.HomeUrl).then((res) {
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      dayDataList = returnData['newVipList'];
      //print(dayDataList);
      Fluttertoast.showToast(
          msg: "网络请求成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          bgcolor: "#000000",
          textcolor: '#ffffff');
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
        return new GestureDetector(
          child: new Card(
            child: new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Center(
                        child: new Text(
                          dayDataList[index]["itemTitle"],
                          style: _biggerFont,
                        ),
                      ),
                      new Center(
                        child: new Image.network(
                          dayDataList[index]["newTitleIconUrl"],
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  new Row(
                    children: [
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Container(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: new Text(
                                '测试',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            new Text(
                              'Kandersteg, Switzerland',
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
            ),
          ),
          onTap: () => _toDetail(dayDataList[index]["itemTitle"].toString()),
        );
      },
    );
  }

  void _toDetail(String id) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new DetailPage(id)));
  }
}
