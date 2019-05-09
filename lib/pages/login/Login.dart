import 'package:flutter/material.dart';
import 'package:scet_warn/utils/alert/ToastWidget.dart';
import 'package:scet_warn/routers/Application.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _userName;

  String _passWord;

  bool _isCheck = false;

  void _forSubmitted() {
    var _form = _formKey.currentState;
    if (_form.validate()) {   // 判断是否验证过（密码超过6位）
    }
    _form.save();
    _postLogin(_userName, _passWord);
  }

  void _postLogin(String userName, String passWord) {
    Application.router.navigateTo(context, "/");
    // if(userName.isNotEmpty && passWord.isNotEmpty) {
      // Map<String, String> params = new Map();
      // params['userName'] = userName;
      // params['passWord'] = passWord;
      // Http.post(Api.USER_LOGIN, params: params).then((result) {
        // Application.router.navigateTo(context, "/");
        // Navigator.pop(context);
      // });
    // } else {
      // ToastWidget.showToastMsg('请输入用户名和密码！');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //使用ScrollView包装一下，否则键盘弹出时会报错空间溢出
      body: new SingleChildScrollView(
        child: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: new Stack(
            children: <Widget> [
              new Image.asset(
                'lib/assets/images/login_bg.png',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
              new Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width / 2 - MediaQuery.of(context).size.width * 0.86 / 2 - 5.0,
                child: new Opacity(        //透明度
                  opacity: 0.87,
                  child: new ClipRRect(   //自定义圆角
                    borderRadius: BorderRadius.circular(10),
                    child: new Container(
                      margin: new EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                        boxShadow: [BoxShadow(color: Color(0xFFBBDEFB), blurRadius: 1.0, spreadRadius: 2.0), ],
                        color: Color(0XFFFFFFFF),
                      ),
                      child: new Form(
                        key: _formKey,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 10.0), 
                                  child: new Text(
                                    'YUJING', 
                                    style: new TextStyle(
                                      fontSize: 50.0, 
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                    )
                                  )
                                ),
                                new Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                  child:new TextFormField(
                                    decoration: new InputDecoration(
                                      hintText: '请输入账号',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none
                                      ),
                                      prefixIcon: Icon(Icons.person),
                                      filled: true,
                                      fillColor: const Color(0xffe3f2fd),
                                    ),
                                    onSaved: (val) {
                                      _userName = val;
                                    },
                                  ),
                                ),
                                new Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                  child:new TextFormField(
                                    decoration: new InputDecoration(
                                      hintText: '请输入密码',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: const Color(0xffe3f2fd),
                                    ),
                                    obscureText: true, //输入框内容隐藏
                                    validator: (val) {
                                      return val.length < 6 ? "密码长度错误" : null;
                                    },
                                    onSaved: (val) {
                                      _passWord = val;
                                    },
                                  ),
                                ),
                                new Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 40.0),
                                  child: new Row(
                                    children: <Widget> [
                                      new Checkbox(
                                        value: _isCheck,
                                        activeColor: Colors.blue,
                                        onChanged: (bool){
                                          setState(() {
                                            _isCheck = bool;
                                          });
                                        },
                                      ),
                                      new Text(
                                        '记住密码',
                                        style: new TextStyle(
                                          color: Colors.blue
                                        )
                                      )
                                    ]
                                  )
                                ),
                              ],
                            ),
                            new Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              margin: EdgeInsets.only(bottom: 30.0),
                              child: new RaisedButton(
                                color: Color(0XFF2288F4),
                                elevation: 6.0,
                                onPressed: _forSubmitted,
                                child: new Text(
                                  '登录',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize:16.0
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                bottom: MediaQuery.of(context).size.height * 0.05,
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  child: new Text(
                    '© 广东中联兴环保科技有限公司',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blue,
                    )
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}