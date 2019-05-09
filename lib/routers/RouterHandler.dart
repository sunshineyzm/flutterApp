import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:scet_warn/pages/map/MapPage.dart';
import 'package:scet_warn/pages/login/Login.dart';
import 'package:scet_warn/pages/monitor/MonitorStation.dart';
import 'package:scet_warn/pages/monitor/StationDetails.dart';
import 'package:scet_warn/pages/mine/PersonalCenter.dart';
import 'package:scet_warn/pages/404.dart';
import 'package:scet_warn/pages/information/InfoCenter.dart';
import 'package:scet_warn/pages/information/InspectionForm.dart';
import 'package:scet_warn/pages/warnCenter/WarnCenter.dart';

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var mapHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MapPage();
  },
);

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Login();
  },
);

var mineHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new PersonalCenter();
  },
);

var monitorHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MonitorStation();
  },
);

// 站点详情
var stationDetailsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String stId = params['stId']?.first;
    String title = params['title']?.first;
    return new StationDetails(stId, title);
  },
);

// 信息中心
var infoCenterHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new InfoCenter();
  },
);
var inspectionFormHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return new InspectionForm();
  }
);

// 警情中心
var warnCenterHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return new WarnCenter();
  }
);

