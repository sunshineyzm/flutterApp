import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scet_warn/routers/Application.dart';

class PersonalCenter extends StatefulWidget {
  _PersonalCenterState createState() => _PersonalCenterState();
}

class _PersonalCenterState extends State<PersonalCenter> {
  File _image;

  // 打开系统相册并选择一张照片
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // 更新用作头像的照片。
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(bottom: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 245.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Image.asset(
                    'lib/assets/images/personCenter_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // 标题栏
                new Positioned(
                  top: MediaQueryData.fromWindow(window).padding.top + 5.0,  //状态栏高度
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0), 
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                        new IconButton(icon: new Icon(Icons.edit, color: Colors.white), tooltip: '设置',onPressed: null,),
                        new Text('个人中心', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400)),
                        new IconButton(icon: new Icon(Icons.chat, color: Colors.white), tooltip: '聊天',onPressed: null,),
                      ]
                    ),
                  ),
                ),
                // 头像部分
                new Positioned(
                  top: 130.0,
                  left: 20.0,
                  child: new GestureDetector(
                    onTap: getImage,
                    child: new Container(
                      width: 120.0,
                      height: 120.0,
                      child: new Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: new ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: _image == null ? _defaultImage : _uploadImage(_image),
                            )
                          ),
                          Align(
                            alignment: const FractionalOffset(1.0, 0.9),
                            child: new ClipOval(
                              child: new Container(
                                width: 30.0,
                                height: 30.0,
                                color: Colors.blue,
                                child: new Icon(Icons.edit, size: 15, color: Colors.white),
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            ),
            // 姓名
            new Container(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    '邓员工',
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: new Text(
                      '编号：Y123456',
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 16.0,
                      )
                    ),
                  )
                ]
              )
            ),
            // 职称
            new Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: 90.0,
                  decoration: new BoxDecoration(
                    color: Theme.of(context).cardColor,
                    gradient: LinearGradient(
                      colors: [Color(0xFF0091EA), Color(0XFF29B6F6), Color(0XFF00E5FF)], 
                      begin: FractionalOffset(0, 1), 
                      end: FractionalOffset(1, 0)
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text('技术/职称',style: new TextStyle(color: Colors.white)),
                          new Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: new Text('软件工程师',style: new TextStyle(color: Colors.white,fontSize:16.0, fontWeight: FontWeight.w600))
                          )
                        ]
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Text('电话',style: new TextStyle(color: Colors.white)),
                              new Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new Text('123 4567 8912',style: new TextStyle(color: Colors.white,fontSize:16.0, fontWeight: FontWeight.w600))
                              )
                            ]
                          ),
                          new Row(
                            children: <Widget>[
                              new Text('微信号',style: new TextStyle(color: Colors.white)),
                              new Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new Text('scetzhong',style: new TextStyle(color: Colors.white,fontSize:16.0, fontWeight: FontWeight.w600))
                              )
                            ]
                          ),
                        ]
                      )
                    ]
                  )
                ),
              )
            ),
            // 单位
            new Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 80.0),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: 90.0,
                  decoration: new BoxDecoration(
                    color: Theme.of(context).cardColor,
                    gradient: LinearGradient(
                      colors: [Color(0xFF0091EA), Color(0XFFBA68C8), Color(0XFF8E24AA)], 
                      begin: FractionalOffset(0, 1), 
                      end: FractionalOffset(1, 0)
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text('单位',style: new TextStyle(color: Colors.white)),
                          new Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: new Text('广东中联兴环保科技有限公司',style: new TextStyle(color: Colors.white,fontSize:16.0, fontWeight: FontWeight.w600))
                          )
                        ]
                      ),
                      new Row(
                        children: <Widget>[
                          new Text('地址',style: new TextStyle(color: Colors.white)),
                          new Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: new Text('广州市海珠区沥滘路368号13层01单元',overflow: TextOverflow.ellipsis, style: new TextStyle(color: Colors.white,fontSize:16.0, fontWeight: FontWeight.w600,))
                          )
                        ]
                      )
                    ]
                  )
                ),
              )
            ),
            // 退出登录
            new Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 70.0),
              child: new RaisedButton(
                color: Color(0xFF1D7DFE),
                child: new Text(
                  '退出登录',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize:16.0
                  ),
                ),
                onPressed: (){Application.router.navigateTo(context, '/login');}
              ),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Application.router.navigateTo(context, '/')
        },
        child: new Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _defaultImage = Image.network(
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3988984084,1846890409&fm=26&gp=0.jpg",
    fit: BoxFit.fill,
    height: 110.0,
    width: 110.0,
  );

  Widget _uploadImage(File image) {
    return Image.file(
      image,
      fit: BoxFit.fill,
      height: 110.0,
      width: 110.0,
    );
  }
}