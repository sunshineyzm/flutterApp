import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:scet_warn/config/Api.dart';
import 'package:scet_warn/utils/alert/ToastWidget.dart';

class Http {
  /******** get请求 ********/
  static Future<dynamic> get(String url,{Map<dynamic, dynamic> params}) async {
    if (params == null) {
      params = new Map();
    }
    String _url = Api.BASE_URL + url;
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length -1);
      _url += paramStr;
    }
    print('接口地址为: $_url');
    http.Response res = await http.get(_url);
    if (res.statusCode == 200) {
      List jsonStr = json.decode(res.body);
      return jsonStr;
      // dynamic errCode = jsonStr['errCode'];
      // if (errCode == null) {
      //   dynamic data = jsonStr['data'];
      //   print('接口数据： $data');
      //   return data;
      // } else {
      //   ToastWidget.showToastMsg(errCode);
      // }
    } else {
      ToastWidget.showToastMsg('您的网络好像不太好哟!');
    }
  }

  /******** post请求 ********/
  static Future<Map> post(String url, {Map<dynamic, dynamic> params}) async {
    if (params == null) {
      params = new Map();
    }
    String _url = Api.BASE_URL + url;
    http.Response res = await http.post(_url, body: params);
    return _dealWithres(res);
  }
  static Map<String, dynamic> _dealWithres(var res) {
    if (res.statusCode == 200) {
      Map jsonStr = json.decode(res.body);
      String errCode = jsonStr['errorCode'];
      if (errCode == null) {
        var data = jsonStr['data'];
        print('接口数据：$data');
        return data;
      } else {
        ToastWidget.showToastMsg(jsonStr['errorMsg']);
      }
    } else {
      ToastWidget.showToastMsg('您的网络好像不太好哟!');
      return null;
    }
  }
}