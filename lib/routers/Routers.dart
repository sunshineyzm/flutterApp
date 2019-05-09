import 'package:fluro/fluro.dart';
import './RouterHandler.dart';

class Routers{
  static String mapPage = "/";
  static String loginSimple = "/login";
  static String mineSimple = "/mine";
  static String monitorSimple = "/monitor";
  static String stationDetailsSimple = "/monitor/station";
  static String infoCenterSimple = "/infoCenter";
  static String inspectionFormSimple = "/infoCenter/inspectionForm";
  static String warnCenterSimple = "/warnCenter";

  static void configureRouters(Router router) {
    router.define('/404', handler: widgetNotFoundHandler);
    router.define(mapPage, handler: mapHandler);
    router.define(loginSimple, handler: loginHandler, transitionType: TransitionType.native);
    router.define(mineSimple, handler: mineHandler);
    router.define(monitorSimple, handler: monitorHandler);
    router.define(stationDetailsSimple, handler: stationDetailsHandler);
    router.define(infoCenterSimple, handler: infoCenterHandler);
    router.define(inspectionFormSimple, handler: inspectionFormHandler);
    router.define(warnCenterSimple, handler: warnCenterHandler);
  }
}