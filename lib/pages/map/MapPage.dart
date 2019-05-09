import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:scet_warn/routers/Application.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MapPageState();
  }
} 

class _MapPageState extends State<MapPage> {

  var _mapType = 'http://www.google.cn/maps/vt?lyrs=m@189&gl=cn&x={x}&y={y}&z={z}';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(
      //     '园区预警', 
      //     style: new TextStyle(
      //       color: Colors.white
      //     )
      //   ),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   iconTheme: new IconThemeData(color: Colors.white),
      //   leading: new IconButton(
      //     icon: new Icon(Icons.person),
      //     tooltip: '左侧栏',
      //     onPressed: () {
      //       Application.router.navigateTo(context, "/mine");
      //     }
      //   ), 
      //   actions: <Widget>[
      //     new IconButton(
      //       icon: new Icon(Icons.warning),
      //       tooltip: '警情',
      //       onPressed: () {
      //         Application.router.navigateTo(context, '/warnCenter');
      //       }
      //     ),
      //     new IconButton(
      //       icon: new Icon(Icons.chat),
      //       tooltip: '消息',
      //       onPressed: () {
      //         Application.router.navigateTo(context, "/infoCenter");
      //       }
      //     ),
      //   ]
      // ),
      body: new Container(
        child: new Stack(
          children: <Widget> [
            new FlutterMap(
              options: new MapOptions(
                center: new LatLng(38.3565936184,117.5206784738),
                zoom: 13.0,
                minZoom: 5.0,
                maxZoom: 18.0,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: _mapType,  // 卫星 
                ),
                // 标注点
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      point: new LatLng(38.3565936184,117.5206784738),
                      builder: (ctx) =>
                      new Container(
                      child: new IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.location_on, size: 35.0,color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            _mapType = 'http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}';
                          });
                        },
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            new Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ClipRRect(
                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                      child: new Container(
                        width: 42.0,
                        height:42.0,
                        color: Color(0XFF1D7FFE),
                        child: new Center(
                          child: new IconButton(
                            onPressed: (){ Application.router.navigateTo(context, '/warnCenter'); },
                            icon: Icon(Icons.notifications_active,size: 20,color: Colors.white),
                            highlightColor: Colors.red,
                            splashColor: Colors.red,
                            disabledColor: Colors.blueGrey,
                          )
                        ),
                      ),
                    ),
                    new ClipRRect(
                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                      child: new Container(
                        width: 42.0,
                        height:42.0,
                        color: Color(0XFF1D7FFE),
                        child: new Center(
                          child: new IconButton(
                            onPressed: (){ Application.router.navigateTo(context, '/infoCenter');},
                            icon: Icon(Icons.chat,size: 20,color: Colors.white),
                            highlightColor: Colors.red,
                            splashColor: Colors.red,
                            disabledColor: Colors.blueGrey,
                          )
                        ),
                      ),
                    ),
                    new ClipRRect(
                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                      child: new Container(
                        width: 42.0,
                        height:42.0,
                        color: Color(0XFF1D7FFE),
                        child: new Center(
                          child: new IconButton(
                            onPressed: (){ Application.router.navigateTo(context, '/mine'); },
                            icon: Icon(Icons.person,size: 20,color: Colors.white),//filter_none
                            highlightColor: Colors.red,
                            splashColor: Colors.red,
                            disabledColor: Colors.blueGrey,
                          )
                        ),
                      ),
                    ),
                    new GestureDetector(
                      child: ClipOval(
                        child: new Container(
                          width: 42.0,
                          height: 42.0,
                          color: Color(0XFF1D7FFE),
                          child: new Icon(Icons.public, color: Colors.white,)
                        ),
                      ),
                      onTap: () {
                        Application.router.navigateTo(context, '/monitor');
                      },
                    ),
                  ],
                ),
              )
            ),
          ]
        ),
      )
    );
  }
}