import 'package:flutter/material.dart';
class RegistretwoPage extends StatelessWidget {
  const RegistretwoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册第二部"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("跳转到"),
            onPressed: (){
              // Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/RegistreonetherePage');
 
            },
          )
        ],
      ),
    );
  }
}