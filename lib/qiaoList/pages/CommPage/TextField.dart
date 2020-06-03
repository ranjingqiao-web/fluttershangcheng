import 'package:flutter/material.dart';
import 'Login.dart';


 

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var   _username=new TextEditingController();//初始化把表单赋值会用到TextEditingController
   var      _password;//如果初始化不用赋值就可以直接使用 _password
    bool flag=true;
    bool listFlag=true;
  @override
  void initState() { 
    super.initState();
    this._username.text="初始值";
    _password;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("表单页面") ,),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Checkbox(
                    value:this.flag,
                    onChanged: (v){
                          setState(() {
                           this.flag=v; 
                          });
                    },
                ),
                Divider(),
               CheckboxListTile(
                 
                 secondary: Icon(Icons.home),
                 title: Text("这是listTitle"),
                 subtitle: Text('这是二级标题'),
                 activeColor: Colors.red,
                 selected:  this.listFlag,//图标颜色一起改变
                 value: this.listFlag,
                 onChanged: (v){
                   setState(() {
                     this.listFlag=v;
                   });
                 },
               ) 
            ],

         
          ),
            

            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名",
                 
              ),
              controller: _username,
              onChanged: (value){
                setState(() {
                   _username.text=value;
                });
                
              },
            ),
               TextField(
               obscureText: true,  
              decoration: InputDecoration(
                hintText: "密码",
                 
              ), 
              onChanged: (value){
                setState(() {
                   _password=value;
                });
                
              },
            ),
            Container(
              width: double.infinity,//表示宽度与外层容器的宽度一样宽
              child: RaisedButton(
                child: Text("获取文本内容"),
                onPressed: (){
                  print(this._username.text);
                  print(this._password);
                },
              ),
            )
          ],
        ),
    ),
    );
  }
} 

class ranTextInput extends StatelessWidget {
  const ranTextInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
          TextField(),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: "请输入搜索内容",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            maxLines: 4,//多行文本框
            decoration: InputDecoration(
              hintText: "请输入",
              border: OutlineInputBorder(),

            ),
          ), 
          TextField(
            obscureText: true,//设置密码框
            decoration: InputDecoration(
              hintText: "密码框",
              border: OutlineInputBorder(),
            ),
          ), 
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "用户名"
            ),
          ), 
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "密码",
              labelStyle: TextStyle( //修饰文字颜色
                color: Colors.red,
              )
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              hintText: "请输入用户名"
            ),
          )
        ],
      );
  }
}