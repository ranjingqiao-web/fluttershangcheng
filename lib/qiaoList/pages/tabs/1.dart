import 'package:flutter/material.dart';
import '../Commom/images.dart' show RanImg;
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
// import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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

class _MyFlutterRefreshPageState extends State<MyFlutterRefreshPage>
    with TickerProviderStateMixin {
  List swiperDateList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3707128041,2169987362&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2566474693,2383159724&fm=26&gp=0.jpg',
    'https://i0.hdslb.com/bfs/archive/0c735996f2ec270a2bb6e003136dea541c493e2f.jpg@880w_440h.jpg',
    'https://i0.hdslb.com/bfs/archive/2a17825d9738c3f862149d74342d2b27d99653c5.jpg@880w_440h.jpg',
  ];
    List<Map> imgList = [
    {"url": "https://www.itying.com/images/flutter/1.png"},
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"}
  ];
  // Widget _swiperBuilder(BuildContext context, int index) {
  //   return (Image.network(
  //     '${swiperDateList[index]}',
  //     fit: BoxFit.fill,
  //   ));
  // }

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

  int _itemCount; //初始化10条数据

  @override
  void initState() {
    _itemCount = 10;
    super.initState();
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      print('底部事件执行了');
      setState(() {
        _itemCount += 10;
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      print("滚动头部了");
      setState(() {
        _itemCount = 10;
      });
    });
  }
Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
       "https://www.itying.com/images/flutter/1.png",
       fit: BoxFit.fill,
    ));
  }
  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;
    return new Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
          height: 200.0,
            child:Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: 3,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.yellow,
              activeColor: Colors.white,
            )),
            // control: new SwiperControl(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) => print('点击了第$index个'),
          )
          ),



        // Container(
        //   child: BannerSwiper(
        //     //width  和 height 是图片的高宽比  不用传具体的高宽   必传
        //     height: 108,
        //     width: 54,
        //     //轮播图数目 必传
        //     length: swiperDateList.length,
        //     showIndicator: true,
        //     autoLoop: true,

        //     //  selectorWidget: Container( width: 10, height: 10, color: Colors.red,
        //     // decoration: BoxDecoration(
        //     //    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        //     // borderRadius: BorderRadius.all(2.0)
        //     //   //设置四周边框
        //     // ),
        //     //  ),
        //     //  normalWidget: Container( width: 10, height: 10, color: Colors.white, ),// 未选中指示器
        //     //轮播的item  widget 必传
        //     getwidget: (index) {
        //       return new GestureDetector(
        //           child: Image.network(
        //             swiperDateList[index % swiperDateList.length],
        //             fit: BoxFit.cover,
        //           ),
        //           onTap: () {
        //             //点击后todo
        //             print(index);
        //           });
        //     },
        //   ),
        // ),

        // Container(
        //     width: W,
        //     height: 200.0,
        //     child:  Swiper(
        //     itemBuilder: _swiperBuilder,
        //     itemCount: 4,

        //     pagination: new SwiperPagination(

        //         builder: DotSwiperPaginationBuilder(
        //       color: Colors.black54,
        //       activeColor: Colors.white,

        //     )
        //     ),
        //      duration: 1000,
        //     // control: new SwiperControl(),
        //     scrollDirection: Axis.horizontal,
        //     autoplay: true,
        //     onTap: (index) => print('点击了第$index个'),
        //   ),

        //     ),
        Container(
          height: 200,
          child: SafeArea(
              child: Refresh(
            onFooterRefresh: onFooterRefresh,
            onHeaderRefresh: onHeaderRefresh,
            childBuilder: (BuildContext context,
                {ScrollController controller, ScrollPhysics physics}) {
              return Container(
                  child: ListView.builder(
                physics: physics,
                controller: controller,
                itemBuilder: _itemBuilder,
                itemCount: _itemCount,
              ));
            },
          )),
        )
      ],
    ));
  }
}
// Container(
          //   // width: double.infinity,
          //   // height: 150,
          //   child: AspectRatio(
          //     aspectRatio: 16 / 9,
          //     child: Swiper(
          //       itemBuilder: (BuildContext context, int index) {
          //         return new Image.network(
          //           imgList[index]['url'],
                    
          //           fit: BoxFit.fill,
          //         );
          //       },
          //       itemCount: imgList.length,
          //       pagination: new SwiperPagination(),
          //       loop: true,
          //       autoplay: true,
          //       control: new SwiperControl(),
          //     ),
          //   ),
          // ),