import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'package:scet_warn/pages/map/MapPage.dart';
import 'package:scet_warn/routers/Routers.dart';
import 'package:scet_warn/routers/Application.dart';
import 'package:scet_warn/utils/dataStore/SharedPreferences.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';  // 导入flutter的包
import 'package:scet_warn/pages/login/Login.dart';

SpUtil sp;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 配置路由
  MyApp()  {
    final router = new Router();
    Routers.configureRouters(router);
    Application.router = router;
  }
  // 登录判断
  showLoginPage() {
    // bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
    bool showWelcome = true;
    if (showWelcome == null || showWelcome == true) {
      return Login();
    } else {
      return MapPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: new Color.fromRGBO(255, 255, 255, 1.0), //body背景色
      ),
      debugShowCheckedModeBanner: false,
      home: showLoginPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}