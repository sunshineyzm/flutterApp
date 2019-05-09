import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("404"),
        ),
        body: Center(
          child:  Text("404,页面丢失！")
        )
      );
    }
}
