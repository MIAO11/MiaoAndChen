import 'package:flutter/material.dart';
import 'package:manhua/util/Util.dart';
import 'dart:convert';
import '../http/Constants.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../views/Detail.dart';
import '../http/HttpService.dart';

class List extends StatefulWidget {
  @override
  createState() => new ListState();
}

class ListState extends State<List> {
  var result = [];
  var resultList;
  var params = {'page': 1, 'count': 20};
  ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    getData(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  Future getData(isloadmore) async {
    print('开始请求');
    HttpService.get(Constants.ShiUrl, (res) {
      resultList = jsonDecode(res)['result'];
      if (isloadmore) {
        print('加载更多');
        result.addAll(resultList);
      } else {
        print('不是加载更多');
        result = resultList;
      }
      print(result.length);
      setState(() {
        result = result;
      });
    }, params: params);
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < result.length - 1) {
      return GestureDetector(        
         child: new Card(
        child:new Container(          
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(               
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(                     
                      result[index]["title"],                    
                      //overflow: TextOverflow.ellipsis,
                      softWrap: true, //设置自动换行
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                          child: Text(
                            result[index]["authors"],
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Divider(),
            ],
          ),
        ),  
        ),    
        onTap: () => _toDetail(result[index]),         
      );
    }
    if (index == result.length - 1) {
      return _getMoreWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: _renderRow,
          itemCount: result == null ? 0 : result.length,
          controller: _scrollController,
        ),
      ),
    );
  }

  void _toDetail(var params) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new DetailPage(params: params)));
  }

  /*
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    params['page'] = 1;
    getData(false);
    Util.showToast('下拉刷新成功', context);
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

  /*
   * 上拉加载,为list重新赋值
   */
  Future<Null> _getMore() async {
    params['page'] = params['page'] + 1;
    await getData(true);
    return;
  }
}
