import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:manhua/components/MyFlexButton.dart';
import 'package:manhua/util/redux/ThemeRedux.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';

class CommonUtils {
  static final double MILLIS_LIMIT = 1000.0;
  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;
  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;
  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;
  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  ///日期格式转换
  static String getNewsTimeStr(DateTime date) {
    int subTime =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    if (subTime < MILLIS_LIMIT) {
      return "刚刚";
    } else if (subTime < SECONDS_LIMIT) {
      return (subTime / MILLIS_LIMIT).round().toString() + " 秒前";
    } else if (subTime < MINUTES_LIMIT) {
      return (subTime / SECONDS_LIMIT).round().toString() + " 分钟前";
    } else if (subTime < HOURS_LIMIT) {
      return (subTime / MINUTES_LIMIT).round().toString() + " 小时前";
    } else if (subTime < DAYS_LIMIT) {
      return (subTime / HOURS_LIMIT).round().toString() + " 天前";
    } else {
      return getDateStr(date);
    }
  }

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    // List<Color> colors = getThemeListColor();
    themeData = getThemeData(index);
    store.dispatch(new RefreshThemeDataAction(themeData));
  }

  static getThemeData(int index) {
    var ThemeData1 = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.cyan[200],
      platform: TargetPlatform.android,
      textTheme: TextTheme(
          display1: TextStyle(fontSize: 17.0, color: Colors.black),
          display2: TextStyle(fontSize: 13.0, color: Colors.grey),
          display3: TextStyle(fontSize: 23.0, color: Colors.black)),
    );
    var ThemeData2 = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.cyan[200],
      platform: TargetPlatform.android,
      textTheme: TextTheme(
          display1: TextStyle(fontSize: 17.0, color: Colors.black),
          display2: TextStyle(fontSize: 13.0, color: Colors.grey),
          display3: TextStyle(fontSize: 23.0, color: Colors.black)),
    );
    if(index==0){
      return ThemeData1;
    }else{
     return ThemeData2;
    }
  }

  static List<Color> getThemeListColor() {
    return [
      Colors.white,
      Colors.black,
    ];
  }

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }

  static saveImage(String url) async {
    Future<String> _findPath(String imageUrl) async {
      final cache = await CacheManager.getInstance();
      final file = await cache.getFile(imageUrl);
      if (file == null) {
        return null;
      }
      Directory localPath = await CommonUtils.getLocalPath();
      if (localPath == null) {
        return null;
      }
      final name = splitFileNameByPath(file.path);
      final result = await file.copy(localPath.path + name);
      return result.path;
    }
    return _findPath(url);
  }
  static splitFileNameByPath(String path) {
    return path.substring(path.lastIndexOf("/"));
  }
  static getLocalPath() async {
    Directory appDir;
    if (Platform.isIOS) {
      appDir = await getApplicationDocumentsDirectory();
    } else {
      appDir = await getExternalStorageDirectory();
    }
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        return null;
      }
    }
    String appDocPath = appDir.path + "/appflutter";
    Directory appPath = Directory(appDocPath);
    await appPath.create(recursive: true);
    return appPath;
  }


  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
    List<Color> colorList,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: new Container(
              width: width,
              height: height,
              padding: new EdgeInsets.all(4.0),
              margin: new EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                //用一个BoxDecoration装饰器提供背景图片
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: new ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return MyFlexButton(
                      maxLines: 2,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      color: colorList != null ? colorList[index] : Theme.of(context).primaryColor,
                      text: commitMaps[index],
                      textColor: Colors.lightBlue,
                      onPress: () {
                        Navigator.pop(context);
                        onTap(index);
                      },
                    );
                  }),
            ),
          );
        });
  }



}
