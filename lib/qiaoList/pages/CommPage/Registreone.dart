import 'package:flutter/material.dart';
class RegistreonePage extends StatelessWidget {
  const RegistreonePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册页面"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          RaisedButton(
            child: Text("下一步"),
            onPressed: (){
              // Navigator.pushNamed(context, "/RegistretwoPage");
              // 使用替换路由可以自动跳转到跟路由 pushReplacementNamed
              Navigator.of(context).pushReplacementNamed( "/RegistretwoPage");
            },
          )
        ],
      ),
    );
  }
}