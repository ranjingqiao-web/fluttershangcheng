import 'package:flutter/material.dart';

class ButtomyanshiyemianPage extends StatelessWidget {
  const ButtomyanshiyemianPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("右上角图片");
            },
          )
        ],
        title: Container(
          child: Text("详解按钮页面"),
        ),
      ),

    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add,color: Colors.yellow,size: 40,),
      backgroundColor:Colors.red,
      // child: Text("居中"),
      onPressed: (){},
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //上下垂直居中
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,//左右水平居中
            children: <Widget>[
              ButtonBar(//组合按钮，就是多个按钮并排
                children: <Widget>[
                   RaisedButton(
                  child: Text("登录"),
                  onPressed: () {
                    print("登录");
                  },
                ),
                 RaisedButton(
                  child: Text("注册"),
                  onPressed: () {
                    print("注册");
                  },
                ),
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center, //左右水平居中

            children: <Widget>[
             Container(
                child:  OutlineButton(
                  //待边框的按钮
               child: Text("data"),
              ),
             ),

             Container(
               height: 100,
               width: 100,
               child:  RaisedButton(
                // textColor: Colors.red,//文字颜色
                // color: Colors.white,//按钮背景颜色
                disabledColor: Colors.yellow, //按钮禁用时颜色
                disabledTextColor: Colors.red, //按钮禁用时文本颜色
                splashColor: Colors.deepOrange, //点击按钮时水波纹颜色
                highlightColor: Colors.grey, //长按按钮后按钮的颜色
                elevation: 200, //阴影的范围，值越大阴影越大
                
                 shape: CircleBorder(//设置圆形按钮
                    side: BorderSide(
                      color: Colors.white
                    )
                  ),
                child: Text("普通按钮"),
                onPressed: () {
                  print("普通按钮");
                },
              ),
             ),
              Container(
                //可以设置按钮的宽度和高度
                height: 100,
                width: 100,
                child: RaisedButton(
                  child: Text("可以设置按钮的宽度和高度"),
                  onPressed: () {
                    print("普通按钮");
                  },
                ),
              ),
              Container(
                height: 50,
                width: 120,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(//设置边缘角
                    borderRadius: BorderRadius.circular(10)
                  ),
                  icon: Icon(Icons.search),
                  label: Text("图标按钮"),
                  onPressed: () {
                    print("图标按钮");
                  },
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
               RanJingQiaoButton(text: "自定义按钮",height: 60.0,width: 100.0,pressed: (){
                 print("object");
               },),
            ],
          ),
          Row(
            
            //自适应按钮,可以设置按钮的宽度和高度
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  width: 100,
                  margin: EdgeInsets.all(10), //左右有点距离
                  child: RaisedButton(
                    child: Text("自适应按钮"),
                    onPressed: () {
                      print("自适应按钮");
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
// 自定义按钮
class RanJingQiaoButton extends StatelessWidget {
  final text;
  final pressed;
  final double height;
  final double width;

  const RanJingQiaoButton({this.text="",this.pressed=null,this.height=40,this.width=80 });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      ),
    );
  }
}
