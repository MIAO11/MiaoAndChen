import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  var params = {};
  var content;
  var title;
  var authors;
  var contentList;
  DetailPage({Key key, @required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    content = params['content'];
    title = params['title'];
    authors = params['authors'];
    contentList = content.split("|");
    print(contentList);
    print(contentList.length);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('详情'),
      ),
      body: new Center(
        child: new Container(
          padding: EdgeInsets.only(left:0,top:20.0,right:0,bottom:0),
          child: (new VerseList(contentList, title, authors)),
        ),
      ),
    );
  }
}

class VerseList extends StatefulWidget {
  var contentList;
  var title;
  var authors;
  VerseList(this.contentList, this.title, this.authors);
  @override
  createState() => new VerseListState(contentList, title, authors);
}

class VerseListState extends State<VerseList> {
  var contentList;
  var title;
  var authors;
  VerseListState(this.contentList, this.title, this.authors);
  @override
  Widget build(BuildContext context) {
    print(title);
    print(authors);
    print(contentList);
    return new ListView.builder(
        itemCount: contentList == null ? 0 : contentList.length+2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return new Center(                        
              child: new Text(           
              title,
              style: new TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ));
          } 
          else if (index == 1) {
            return new Center(
              child: new Text(authors),
            );
          }
          else {
            return new Container(
                padding: EdgeInsets.only(top: 10.0),
                child: new Container(
                    padding: null,
                    height: 50,
                    child: new Center(
                      child: new Text(
                        contentList[index-2],
                        style: new TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                    )));
          }
        });
  }
}
