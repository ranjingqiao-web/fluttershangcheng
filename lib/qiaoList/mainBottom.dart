import 'package:flutter/material.dart';
 
// 切换tab组件
 class PageName extends StatefulWidget {
   PageName({Key key}) : super(key: key);
 
   @override
   _PageNameState createState() => _PageNameState();
 }
 
 class _PageNameState extends State<PageName> {
   String listData="你好flutter";
   bool isSHow=false;
   @override
   Widget build(BuildContext context) {
     return Container(
        child: Column(

          children: <Widget>[
            Text(this.listData),
            SizedBox(height: 200,),
            RaisedButton(
              child: this.isSHow? Text('按钮1'):Text('按钮2'),
              onPressed: (){
                  setState(() {
                    this.isSHow  =!this.isSHow;
                    print(this.isSHow);
                    if(this.isSHow){
                      this.listData="这是一个好东西"; 
                    }else{
                      this.listData="这333是一个好东西"; 
                    }
                    
                  });
              },
            )
          ],
        ),
     );
   }
 }