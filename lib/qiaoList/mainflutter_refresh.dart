import 'package:flutter/material.dart';
/**
 *
 */
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter_refresh/flutter_refresh.dart';

void main() => runApp(new ListViewFlutterRefresh());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: '第一个俩表',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ListViewFlutterRefresh(),
//       localizationsDelegates: [
//         //   Refresh.delegate()
//       ],
//       routes: {
//         'route':(BuildContext context){
//           return null;
//         },
//       }
//     );
//   }
// }

class ListViewFlutterRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('找门网'),
        ),
        body: new MyFlutterRefreshPage(title: 'Pull to refresh'),
    );
  }
}

class MyFlutterRefreshPage extends StatefulWidget {
  MyFlutterRefreshPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFlutterRefreshPageState createState() => new _MyFlutterRefreshPageState();
}

class _MyFlutterRefreshPageState extends State<MyFlutterRefreshPage> with TickerProviderStateMixin {

  Widget _itemBuilder(BuildContext context, int index) {
    return new Padding(
      key: new Key(index.toString()),
      padding: new EdgeInsets.all(10.0),
      child: Text(
        "顺序数据:$index",
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  int _itemCount;

  @override
  void initState() {
    _itemCount = 10;
    super.initState();
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount += 10;
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount = 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
            child: Refresh(
              onFooterRefresh: onFooterRefresh,
              onHeaderRefresh: onHeaderRefresh,
              childBuilder: (BuildContext context,
                  {ScrollController controller, ScrollPhysics physics})
              {
                return Container(
                    child: ListView.builder(
                      physics: physics,
                      controller: controller,
                      itemBuilder: _itemBuilder,
                      itemCount: _itemCount,
                    ));
              },
            )
        )
    );
  }
} 

// 顶部导航有搜索框的部分
// Scaffold(
//       appBar: AppBar(
//         // leading: Icon(Icons.search, ),
         
//         title: Container(
//           margin: EdgeInsets.only(left: 15),
//           padding: EdgeInsets.only(left: 15),
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(5)
//           ),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: "搜索框里面的数据",
//               border: InputBorder.none,
//               icon: Icon(Icons.search,color: Colors.grey[500],)
//             ),
//           ),
//         ),
//         // centerTitle: true, //文字安卓与ios同步，都放中间
//         automaticallyImplyLeading: true,
//         titleSpacing: 0, //可以让图标居中
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.airplanemode_active),
//             padding: EdgeInsets.all(0),
//             onPressed: (){},
//           )
//         ],
//       ),
//       body:null,
//     );




// 0000000000000000000000000000  // 
// class HomeContentTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: listData.map((value) {
//         print(value);
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 2.0 / 1.0,
//                 child: Image.network(value['listPhoto'] ,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ListTile(
//                 leading: ClipOval(
//                   child: Image.network(
//                    value['listPhoto'],
//                     fit: BoxFit.cover,
//                     width: 60,
//                     height: 60,
//                   ),
//                 ),
//                 title: Text("我是title"),
//                 subtitle: Text(
//                    value['goodsName'],maxLines: 2, overflow: TextOverflow.ellipsis,
//                    ),
//               )
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
// class HomeContentTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Card(
//           margin: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 2.0 / 1.0,
//                 child: Image.network(
//                   "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ListTile(
//                 leading: ClipOval(
//                   child: Image.network(
//                     "https://upload.jianshu.io/users/upload_avatars/4242443/3a79a712-73c4-4296-ba93-d72164fc2406.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/80/h/80/format/webp",
//                     fit: BoxFit.cover,
//                     width: 60,
//                     height: 60,
//                   ),
//                 ),
//                 title: Text("我是title"),
//                 subtitle: Text(
//                     "我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我"),
//               )
//             ],
//           ),
//         ),
//         Card(
//           margin: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 2.0 / 1.0,
//                 child: Image.network(
//                   "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ListTile(
//                 leading: CircleAvatar(
//                     backgroundImage: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg'),
//                   ),
//                 title: Text("我是title"),
//                 subtitle: Text(
//                     "我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我我我李文平我就问就问陪我"),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class HomeContentTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Card(
//           margin: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//               ListTile(
//                 leading: Image.network(
//                     "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg"),
//                 title: Text(
//                   "这是一个标题",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 subtitle: Text("高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级高级"),
//               ),
//             ],
//           ),
//         ),

//       ],
//     );
//   }
// }

// class HomeContentTwo extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return   AspectRatio(
//         aspectRatio: 3.0/1.0,
//         child: Container(
//           color: Colors.red,
//           child: Image.network("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",fit: BoxFit.cover,),
//         ),
//     );
//   }
// }
// class HomeContentTwo extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: Container(
//         height: 400,
//         width: 300,
//         color: Colors.red,
//         child: Stack(
//           children: <Widget>[
//             Align(
//               alignment: Alignment.topLeft,
//               child:Icon(Icons.home,size:40,color:Colors.white),
//             ),
//               Align(
//               alignment: Alignment.centerLeft,
//               child:Icon(Icons.search,size:40,color:Colors.white),
//             ),
//               Align(
//               alignment: Alignment.centerRight,
//               child:Icon(Icons.g_translate,size:40,color:Colors.white),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeContentTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           height: 200,
//           color: Colors.black54,
//           child: Text("你好，通知"),
//         ),
//         Row(
//           children: <Widget>[
//             Expanded(
//               flex: 2,
//               child:  Container(
//                 color: Colors.blue,
//                   height: 150,
//                 child: Image.network(
//                 "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",
//                 fit: BoxFit.cover,
//               ),
//               )
//             ),
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   color: Colors.blue,
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start, //左右布局
//                     mainAxisAlignment: MainAxisAlignment.start, //上下布局
//                     children: <Widget>[
//                       Text(
//                         "999999",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                       Text("000000"),
//                       //  Image.network( "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",fit: BoxFit.cover,),
//                       //   Image.network( "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4021198173,809519829&fm=26&gp=0.jpg",fit: BoxFit.cover,),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ],
//     );
//   }
// }

// class HomeContentTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      return
//     Container(
//       padding: EdgeInsets.fromLTRB(0,10,0,10),
//       color: Colors.pink,
//       child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//          IconContainer(Icons.search,color: Colors.yellow,),
//          IconContainer(Icons.search,color: Colors.black,),
//          IconContainer(Icons.search,color: Colors.yellow,),
//          IconContainer(Icons.search,color: Colors.orange,),

//       ],
//     ),
//     );

//   }
// }

// class IconContainer extends StatelessWidget{
//   double size= 32.0;
//   Color color=Colors.red;
//   IconData icon;
//   IconContainer(this.icon,{this.size,this.color}) ;
//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: 100,
//       width: 100,
//       color: this.color,
//       child: Center(
//          child:Icon( this.icon,size: this.size,color:Colors.white),
//       ),
//     );
//   }

// }
