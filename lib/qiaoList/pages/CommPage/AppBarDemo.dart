// import 'package:flutter/material.dart';
// class AppBarDemoPage extends StatelessWidget {
//   const AppBarDemoPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("这是自定义导航哦"),
//         backgroundColor: Colors.red,//改变导航的背景颜色
//         // centerTitle: true,//无论是安卓还是ios的title都居中
//         leading: IconButton(
//           icon: Icon(Icons.games),
//           onPressed: (){
//             print("按钮");
//           },
//         ), //导航前面加一图标
//         actions: <Widget>[
//           IconButton(
//           icon: Icon(Icons.fast_forward),
//           onPressed: (){
//             print("按钮");
//           },
//         ),

//         ],

//       ),
//       body: Text("主题内容"),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("这是自定义导航哦"),
          backgroundColor: Colors.black87, //改变导航的背景颜色
           
          
           bottom: TabBar(
             
             tabs: <Widget>[
               Tab(text:"热门"),
               Tab(text:"推荐"),
             ],
           ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第一个"),
                ), 
                ListTile(
                  title: Text("第一个"),
                )
              ],
            ),
             ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第二个"),
                ), 
                ListTile(
                  title: Text("第二个"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
