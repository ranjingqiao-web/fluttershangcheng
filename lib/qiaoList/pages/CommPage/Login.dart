import 'package:flutter/material.dart';
import 'Login.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          Text("点击登录会执行登录操作"),
          RaisedButton(
            child: Text("立即登录"),
            onPressed: (){
              // 点击立即登录会返回到登录页面
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
