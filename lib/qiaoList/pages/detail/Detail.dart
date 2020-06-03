import 'package:flutter/material.dart'; 
class DetailPage extends StatefulWidget {
  Map arguments;
  DetailPage({Key key,this.arguments}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(arguments:this.arguments);
}

class _DetailPageState extends State<DetailPage> {
  Map arguments;

  _DetailPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("这是详情页面"),),
      body: Container(
       child: Column(
         children: <Widget>[
           Text("这是详情页面${arguments['id']}")
         ],
       ),
    ),
    );
  }
}