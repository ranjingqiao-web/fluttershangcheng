import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';
import 'package:provide/provide.dart';
import '../../../provide/counter.dart';

 class MinePage extends StatefulWidget {
   MinePage({Key key}) : super(key: key);
 
   @override
   _MinePageState createState() => _MinePageState();
 }
 
 class _MinePageState extends State<MinePage> {
   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.only(top: 200),
      child: Column(children: <Widget>[
        Provide<Counter>(
            builder:(context,child,counter){
            return Text("${counter.value}");
          }
        ),
        // Provide<Counter>(
        //   builder:(context,child,counter){
        //     return Text('${counter.value}');
        //   }
        // ),
        MyButton(),
      ],),
        
     );
   }
 }

 class MyButton extends StatelessWidget {
   const MyButton({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container(
       child: RaisedButton(
         onPressed: (){
           Provide.value<Counter>(context).increment();
         },
         child: Text("递增"),
       ),
     );
   }
 }