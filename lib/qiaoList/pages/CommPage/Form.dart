import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
   final arguments;
    
  
   const FormPage({this.arguments});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("返回"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text('这是我们的${arguments != null? arguments['id']:'9999'}'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("这是一个表单页面"),
          ),
          ListTile(
            title: Text("这是一个表单页面"),
          ),
          ListTile(
            title: Text("这是一个表单页面"),
          ),
          ListTile(
            title: Text("这是一个表单页面"),
          )
        ],
      ),
    );
  }
}
