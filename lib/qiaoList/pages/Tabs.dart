import 'package:flutter/material.dart';
import 'tabs/ClassifiAationPage.dart';
import 'tabs/homePage.dart';
import 'tabs/MinePages.dart';
import 'tabs/ShoppingListPage.dart';
import 'tabs/BrandHallPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 
class PageBottomNavigationBar extends StatefulWidget {
  final index;
  PageBottomNavigationBar({Key key, this.index = 0}) : super(key: key);

  @override
  _PageBottomNavigationBarState createState() =>
      _PageBottomNavigationBarState(this.index);
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar> {
  int _currentIndex = 1;
  _PageBottomNavigationBarState(index) {
    this._currentIndex = index;
  }
  List  _pageList = [
    HomePage(),
    ClassifiAationPage(),
    BrandHallPage(),
    ShoppingListPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
     ScreenUtil.instance=ScreenUtil(width:750,height:1334)..init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页页面配置"),
      // ),


      // 底部居中圆形按钮
    //  floatingActionButton: Container(
    //    height: 50,
    //    width: 50,
    //    padding: EdgeInsets.all(8),
    //    margin: EdgeInsets.only(top:10),
    //    decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(25),
    //      color: Colors.yellow
    //    ),
    //    child: FloatingActionButton(
    //      child: Icon(Icons.add),
    //      onPressed: (){
    //       setState(() {
    //         this._currentIndex = 1;
    //       });
    //      },
    //      backgroundColor: this._currentIndex==1?Colors.black:Colors.red,
    //    ),
    //  ),
    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    // 底部居中圆形按钮




      body: this._pageList[this._currentIndex],
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          print(index);
          setState(() {
            this._currentIndex = index;
          });
        },
        // iconSize: 40.0, //设置图标的大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //如果按钮比较多
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.class_), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.broken_image), title: Text("品牌馆")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("购物清单")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("我的"))
        ],
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           Expanded(
      //             child: UserAccountsDrawerHeader(
      //               accountName: Text("冉老师"),
      //               accountEmail: Text("30173822@qq.com"),
      //               currentAccountPicture: CircleAvatar(
      //                 backgroundImage: NetworkImage(
      //                   "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573622635464&di=30b21cb5057bc25f42ffb3b05edb4d59&imgtype=0&src=http%3A%2F%2Fi4.hexun.com%2F2018-08-01%2F193647293.jpg",
      //                 ),
      //               ),
      //               otherAccountsPictures: <Widget>[
      //                 //左侧可以定义图标
      //                 Image.network(
      //                     "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573622635464&di=30b21cb5057bc25f42ffb3b05edb4d59&imgtype=0&src=http%3A%2F%2Fi4.hexun.com%2F2018-08-01%2F193647293.jpg")
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
            // 其中一种头部显示
            // Row(
            //   children: <Widget>[
            //      Expanded(
            //        child: DrawerHeader(
            //         child: Text("这是侧边栏头部导航"),
            //          decoration: BoxDecoration(
            //            image: DecorationImage(
            //              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573620505003&di=6e270c9120cfa9eeb13e5b182f9589f8&imgtype=0&src=http%3A%2F%2Fwww.wallcoo.com%2Fnature%2FJapan_Hokkaido_Furano_Country_field_1920x1200%2Fs%2FJapan-Hokkaido-Landscape-WUXGA_country_field_0166s_300x300.jpg"),
            //              fit: BoxFit.cover
            //            )
            //          ),
            //        ),

            //      )
            //   ],
            // ),

      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.home),
      //         ),
      //         title: Text("我的空间"),
              
      //       ),
      //       Divider(), //一条线
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.home),
      //         ),
      //         title: Text("用户中心"),
      //          onTap: () {
      //           //  返回到首页就可以加 Navigator.of(context).pop();
      //           Navigator.of(context).pop();
      //           Navigator.pushNamed(context, '/YonghuzhognxinPage');
      //         },
      //       ),
      //       Divider(), //一条线
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.home),
      //         ),
      //         title: Text("设置中心"),
      //       )
      //     ],
      //   ),
      // ),
      // endDrawer: Drawer(
      //   child: Text("右侧抽屉"),
      // ),
    );
  }
}
// https://www.bilibili.com/video/av52490605/?p=30
