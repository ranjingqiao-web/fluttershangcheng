 

import 'package:flutter/material.dart';
import 'Login.dart';
import '../../pages/Tabs.dart';
class RegistreonetherePage extends StatelessWidget {
  const RegistreonetherePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三部"),
      ),
      body:Column(
        children: <Widget>[
          RaisedButton(
            child: Text('请输入验证码哦'),
            onPressed: (){
            // 返回跳转到指定页面
            
                // 以下都是跳转到跟路由的方法，要引入页面，再跳转到对应的页面位置
                Navigator.of(context).pushAndRemoveUntil(
               
                new MaterialPageRoute(builder:(context)=>new PageBottomNavigationBar(index:0)), (route)=>route==null);
              //new MaterialPageRoute(builder:(context)=>new LoginPage()), (route)=>route==null);
              // Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }
}