import 'dart:developer';
import 'dart:convert'; 
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_demo/ranHero/ranHero.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';
/**
 *
 */
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:url_launcher/url_launcher.dart'; //打电话组件
import 'package:provide/provide.dart';
import '../../../provide/counter.dart';
import '../../../provide/provide_detail.dart';

// SingleChildScrollView
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('找门网${Provide.value<DetailsInfoProvide>(context).goodsInfo}'),
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

class _MyFlutterRefreshPageState extends State<MyFlutterRefreshPage>
    with  TickerProviderStateMixin {
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
    SeachGetListAll("强化门").then((val) {
      print("object");
    });
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

  // Future<Null> onHeaderRefresh() {
  //   return new Future.delayed(new Duration(seconds: 2), () {
  //     setState(() {
  //       _itemCount = 10;
  //     });
  //   });
  // }

  TextEditingController typeController = TextEditingController(); //声明一个类
  String showText = "欢迎你来到找门网欢迎你来到找门网";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: FutureBuilder(
                  future: LunBoList({}),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      // var data=snapshot.data['data'];
                      // List swiper = data.map((img){return img['imgSrc'];}).toList();
                      print("==========>>>>>>$data");
                      List<Map> swiper = (data['data'] as List).cast();
                      List<Map> GuridViewLists = (data['data'] as List).cast();
                      // banner图片
                      String adPicture =
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575453774817&di=3cba7c6ef4e0cbb64eb93d103fdce3c2&imgtype=0&src=http%3A%2F%2Fportal.inout.asia%2Fimages%2Fbanner.jpg';
                      String leaderImage =
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575454202830&di=0beb1cc5f6a24dc9e7a4e39d7bc80165&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F9f499d904976bdbf388811302fbedcc85f8138981a66e-pQ29fe_fw658';
                      String leaderPhone = '15388269760';
                      List<Map> RecommendList = (data['data'] as List).cast();

                      return Column(
                        children: <Widget>[
                          SwiperDiy(swiperDateList: swiper),
                          GuridView(GuridViewList: GuridViewLists),
                          AdBanner(adPicture: adPicture),
                          LeaderPhone(
                              leaderImage: leaderImage,
                              leaderPhone: leaderPhone),
                              Recommend(RecommendList:RecommendList),
                              HotGoods(),
                               
                        ],
                      );
                    } else {
                      return Text("加载中......");
                    }
                  },
                ),
              ),
              Container(
                height: 300.0,
                child: SafeArea(
                    child: Refresh(
                  onFooterRefresh: onFooterRefresh,
                  // onHeaderRefresh: onHeaderRefresh,
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
          ),
        ),
      )),
    );
  }

  void _choiceAction() {
    print("111111111111111111");
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('美女类型不能为空'),
              ));
    } else {
      final parmes = {
        'arrCargoId': [31],
        'brandId': "",
        'cargoId': [],
        'condition': "",
        'keyword': typeController.text.toString(),
        'mannerId': "",
        'pageNum': 1,
        'pageSize': 6,
        'positionId': "",
      };

      SeachGetListAll(parmes).then((val) {
        print(val);
        setState(() {
          showText = val['data']['keyword'];
        });
      });

      //  getHttp(typeController.text.toString()).then((val) {
      //   print("页面赋值的数据++++++++" + val.toString());
      //   //  Future 使用Future的作用就是，此处回调完了以后会有一个函数
      //   // val 就是getHttp()方法里面return 的值
      //   setState(() {
      //     showText = val['data']['keyword'];
      //   });
      // });
    }
  }
}

// 首页轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({this.swiperDateList});
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    final size = MediaQuery.of(context).size;
    final W = size.width;
    final H = size.height;
    return Container(
      // padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
      height: ScreenUtil.getInstance().setHeight(400),
      width: ScreenUtil.getInstance().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${swiperDateList[index]['imgSrc']}',
            fit: BoxFit.cover,
          );
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 品牌区域
class GuridView extends StatelessWidget {
  final List GuridViewList;
  GuridView({Key key, this.GuridViewList}) : super(key: key);
  Widget _GuridViewItem(BuildContext context, item) {
    return InkWell(
        onTap: () {
          print('点击了导航');
        },
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(95),
              height: ScreenUtil().setHeight(95),
              child: ClipRRect(
                //设置边缘角 ClipRRect
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item['imgSrc'],
                  width: ScreenUtil().setWidth(95),
                  height: ScreenUtil().setHeight(95),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(item['id'].toString())
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (this.GuridViewList.length > 10) {
      this.GuridViewList.removeRange(10, this.GuridViewList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
      decoration: BoxDecoration(color: Colors.red //设置背景颜色
          // backgroundBlendMode: BlendMode.color
          ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(5.0)),
        children: GuridViewList.map((item) {
          return _GuridViewItem(context, item);
        }).toList(),
      ),
    );
  }
}

class AdBanner extends StatelessWidget {
  final String adPicture;
  const AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750.0),
      color: Colors.blue,
      child: Image.network(
        adPicture,
        height: ScreenUtil.getInstance().setHeight(120),
        fit: BoxFit.cover,
      ),
    );
  }
}

// 拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //商家图片
  final String leaderPhone; //商家电话
  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchUrl() async {
    String url = "tel:" + leaderPhone;
    //  String url= 'https://www.jianshu.com/p/77c4b8a84734';
    //  print('leaderPhone'+leaderPhone);
    if (await canLaunch(url)) {
      await launch(url);
      print('leaderPhone==' + url);
    } else {
      throw 'url产生了异常';
    }
  }
}

// 商品推荐
class Recommend extends StatelessWidget {
  final List RecommendList;
  const Recommend({Key key, this.RecommendList}) : super(key: key);
  Widget _titleWidget() {
     
    
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '平拍分路',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //  商品列表
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        width: ScreenUtil.getInstance().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 1.0, color: Colors.yellow))),
                child: Column(
                  children: <Widget>[
                    Image.network(RecommendList[index]['imgSrc']),
                    Text("data${RecommendList[index]['imgSrc']}",
                    overflow: TextOverflow.ellipsis,
                     maxLines: 1,
                   
                    ),
                    Text("data${RecommendList[index]['id']}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red
                    ),
                    ),
                  ],
                ),
      ),
    );
  }

// 横向列表
Widget _recommedList(){
  return Container(
    height: ScreenUtil().setHeight(300),
    margin: EdgeInsets.only(top:10.0),
    child: ListView.builder(
     scrollDirection: Axis.horizontal,
     itemCount: RecommendList.length,
     itemBuilder: (context,index){
       return _item(index);
     },
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
     height: ScreenUtil().setHeight(380),
     margin: EdgeInsets.only(top:10.0),
     child: Column(
       children: <Widget>[
         _titleWidget(),
         _recommedList(),

       ],
     ),
    );
  }
}
// 上拉加载更多
class HotGoods extends StatefulWidget {
  // HotGoods({Key key}) : super(key: key);
  @override
  _HotGoodsState createState() => _HotGoodsState();

  
}
  
class _HotGoodsState extends State<HotGoods> {
    @override
  void initState() { 
    super.initState();
    var parmas={"pSize":10,"pNum":1,"roleId":5,"userCode":""};
    QUERYNEWQUERYNEWPRODUCTS(parmas).then((val){
      /*将字符串转成json  返回的是键值对的形式*/
    // Map<String, dynamic> news = jsonDecode(val);
    /*取值*/
    // String sats = news['result']['stat'];

      // Map userMap = json.decode(val);
      // var user = new User.toString();
 
      // print('Howdy, ${user.name}!');
      // print('We sent the verification link to ${user.email}.');


       print("推荐列表------------->"+val);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("jspang2"),
    );
  }
}



// 楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;
  const FloorTitle({Key key,this.picture_address:"http://picture3.51zhaomen.com/upload_pic_品牌馆广告2.jpg"}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(ScreenUtil().setWidth(8)),
      child: Image.network(picture_address,fit: BoxFit.cover,),
    );
  }
}
// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key,this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
  Widget _otherGoods(){
    return Row(
      children: <Widget>[

      ],
    );
  }
  Widget _firstRow(){
   return Row(
     children: <Widget>[
      //  _goodsItem(),//第一个图片列表组件
         Column(
           children: <Widget>[

           ],
         )
     ],
   );
  }
  Widget _goodsItem(Map goods){
     return Container(
       width: ScreenUtil().setWidth(375),
       child: InkWell(
         onTap: (){},
         child: Image.network(goods['imgSrc']),
       ),
     );
  }
}

// TextField(
//               controller: typeController,
//               decoration: InputDecoration(
//                   //修饰文本框
//                   contentPadding: EdgeInsets.all(10.0),
//                   labelText: "美女类型",
//                   helperText: "请输入你喜欢的类型"),
//               autofocus: false, //加上这句话是为了不让它默认开启手机键盘
//             ),
//             RaisedButton(
//               onPressed: _choiceAction,
//               child: Text("选择完毕"),
//             ),
//             Text(
//               showText,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
