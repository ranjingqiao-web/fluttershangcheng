import 'package:flutter/material.dart';

class RadioSwitchPage extends StatefulWidget {
  RadioSwitchPage({Key key}) : super(key: key);

  @override
  _RadioSwitchPageState createState() => _RadioSwitchPageState();
}

class _RadioSwitchPageState extends State<RadioSwitchPage> {
  int sex;
  int boy;
  bool flag=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  onChanged: (v) {
                    setState(() {
                      this.sex = v;
                    });
                    print(v);
                  },
                  groupValue: this.sex,//按钮组一次选中一个必须配置groupValue
                ),
                Text("女"),
                Radio(
                  value: 2,
                  onChanged: (v) {
                    setState(() {
                      this.sex = v;
                    });
                    print(v);
                  },
                  groupValue: this.sex,
                ),
                Text("男"),
              ],
            ),
            Row(
              children: <Widget>[
                Text("${this.sex}"),
                Text("${this.sex == 1 ? "女" : "男"}"),
              ],
            ),
            SizedBox(height: 30,),
            Column(
              children: <Widget>[
                RadioListTile(
                  title: Text("标题RadioListTile"),
                  subtitle: Text("离开完了去问问"),
                  secondary: Image.network("https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg"),
                  value: 2,
                  onChanged: (v){
                    setState(() {
                      this.boy=v;
                    });
                    print(v);
                  },
                  activeColor: Colors.red,
                  groupValue: this.boy,
                  selected: this.boy==2,
                ),
                   RadioListTile(
                  title: Text("标题RadioListTile"),
                  subtitle: Text("离开完了去问问"),
                  secondary: Image.network("https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg"),
                  value: 3,
                  onChanged: (v){
                     setState(() {
                      this.boy=v;
                    }); 
                    print(v);
                  },
                  activeColor: Colors.red,
                  groupValue: this.boy,
                   selected: this.boy==3,//加上就显示选中的颜色
                )
              ],
              
            ),
            Column(
              children: <Widget>[
                Switch(
                  value: this.flag,
                  onChanged: (v){
                    setState(() {
                      this.flag=v;
                    });
                    print(v);
                  },
                )  
              ],      
            )
          ],
        ),
      ),
    );
  }
}
