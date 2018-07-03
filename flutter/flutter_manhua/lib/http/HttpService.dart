import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;
  UserAgentClient(this.userAgent, this._inner);
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}

class HttpService{
  var client = new UserAgentClient('user-agent',new http.Client());

  get(url,params){
    http.read(url).then((response){
      print(response);
      return response;
    });
  }

}


