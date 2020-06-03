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
 


class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {

// *****TabController 一定要跟文件名一致
TabController _tabController;
  @override
  void initState(){//主键初始化的时候触发
    super.initState();
    _tabController=new TabController(
      vsync: this,
      length: 2
    );
    _tabController.addListener((){
        print(_tabController.index);
    });
  }
 @override 
  void dispose(){//主键销毁的时候触发
    super.dispose();
    _tabController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: "热销",),
            Tab(text: "推荐",),
          ],
        ),
      ),
      body: TabBarView(
         controller: this._tabController,
        children: <Widget>[
            Center(
              child: Text("热销"),
            ),
             Center(
              child: Text("推荐"),
            )
        ],
      ),
    );
  }
}
