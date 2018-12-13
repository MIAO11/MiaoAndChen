import 'package:flutter/material.dart';
import 'dart:convert';
import '../http/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../views/Detail.dart';
import '../http/HttpService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class List extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<List> {
  var dayDataList=[];
  var _isFavorited = true;
  
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    HttpService.get(Constants.HomeUrl, (res) {
      Map data = jsonDecode(res)['data'];
      Map returnData = data['returnData'];
      dayDataList = returnData['newVipList'];
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

  Widget _renderRow(BuildContext context, int index) {
    final _biggerFont = const TextStyle(fontSize: 18.0);
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
  }

  @override
  Widget build(BuildContext context) {
    print(dayDataList);
    return new Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: _renderRow,
          itemCount: dayDataList == null ? 0 : dayDataList.length,
        ),
      ),
    );
  }

  void _toDetail(String id) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new DetailPage(id)));
  }

  /*
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    getData();
    Fluttertoast.showToast(
        msg: "下拉刷新成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        bgcolor: "#000000",
        textcolor: '#ffffff');
    // await Future.delayed(Duration(seconds: 3), () {
    //   print('refresh');
    //   setState(() {
    //     dayDataList = [];
    //   });
    // }
  }
}
