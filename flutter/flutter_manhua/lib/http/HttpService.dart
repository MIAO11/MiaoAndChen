import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;
  UserAgentClient(this.userAgent, this._inner);
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}

class HttpService {
  static void get(String url, Function callback, 
      {Map<String, Object> params, Function errorCallback}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
      print(url);
    }
    try {
      http.Response res = await http.get(url);       
      if (callback != null) {
        callback(res.body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      http.Response res = await http.post(url, body: params);

      if (callback != null) {
        callback(res.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
