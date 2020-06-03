import 'package:flutter/material.dart';
class name extends StatelessWidget {
  const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("data")),
      body: getMyselfe(bodyContent:'ewkwelekewlewe'),
    );
  }
}
class getMyselfe extends StatefulWidget {
  getMyselfe({Key key,this.bodyContent}) : super(key: key);
  final String bodyContent;
  @override
  _getMyselfeState createState() => _getMyselfeState();
}

class _getMyselfeState extends State<getMyselfe> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("data"),
    );
  }
}