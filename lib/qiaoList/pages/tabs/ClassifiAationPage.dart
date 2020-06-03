import 'package:flutter/material.dart';
import 'package:flutter_demo/ranHero/ranHero.dart';
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/childProvide.dart';
import '../../../provide/provide_right_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart'; //下拉加载更多
import 'package:fluttertoast/fluttertoast.dart';
import '../../../routes/fluro_application.dart';  //引入路由文件

class ClassifiAationPage extends StatefulWidget {
  ClassifiAationPage({Key key}) : super(key: key);

  @override
  _ClassifiAationPageState createState() => _ClassifiAationPageState();
}

class _ClassifiAationPageState extends State<ClassifiAationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftData(),
            Column(
              children: <Widget>[RightListData(), CategoryGoodsList()],
            )
          ],
        ),
      ),
    );
  }
}

// 左侧列表 LeftData
class LeftData extends StatefulWidget {
  LeftData({Key key}) : super(key: key);

  @override
  _LeftDataState createState() => _LeftDataState();
}

class _LeftDataState extends State<LeftData> {
  var activeIndex = 0;
  // 初始化列表
  List leftListData = [];
  // 右侧图片列表
  List listImage = [];

  @override
  void initState() {
    super.initState();
    _getAllListData();
    // 初始化让列表显示合页
    _FenLeiRIGHTList(46, 1);
  }

  @override
  Widget build(BuildContext context) {
    Widget _leftInkWell(int index) {
      bool isClick = false;
      isClick = (index == activeIndex) ? true : false;
      return InkWell(
        onTap: () {
          print("=====>" + leftListData[index]['id'].toString());
          setState(() {
            activeIndex = index;
          });
          _FenLeiRIGHTList(leftListData[index]['id'], 1);
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left: 10, top: 20),
          decoration: BoxDecoration(
              color: Colors.white, //白色背景
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Text(
            leftListData[index]['cargoName'],
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: isClick ? Colors.red : Colors.black),
          ),
        ),
      );
    }

    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: leftListData.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  void _getAllListData() async {
    FenLeiList({}).then((val) {
      //  左侧边栏列表
      List zmCargoList = val['data']['zmCargoList'];
      setState(() {
        leftListData = zmCargoList;
      });
      print("value====" + val['data']['zmCargoList'].toString());
    });
  }

  // 商品分类的右侧列表内容
  void _FenLeiRIGHTList(int id, int page) async {
    // print("********${Provide.value<ProvideList>(context).leftId}***********>");
    //直接获取Provide参数值 Provide.value<ProvideList>(context).leftId
    var parms = {'cargoId': id, 'pNum': page, 'pSize': 6};
    FenLeiRIGHTList(parms).then((val) {
      setState(() {
        listImage = val['data']['dataList'];
      });
      print("右侧数据---->" + val['data']['dataList'].toString());

      if (val['data']['dataList'] == null) {
        Provide.value<ProvideList>(context).provideListsAdd([], 0);
      } else {
        Provide.value<ProvideList>(context)
            .provideListsAdd(val['data']['dataList'], id);
      }
      // print("value====" + val['data']['zmCargoList'].toString());
    });
  }
}

// 右侧顶部导航
class RightListData extends StatefulWidget {
  RightListData({Key key}) : super(key: key);

  @override
  _RightListDataState createState() => _RightListDataState();
}

class _RightListDataState extends State<RightListData> {
  var activeId = 0;
  List RightList = [
    "名酒1",
    "名酒2",
    "名酒3",
    "名酒4",
    "名酒5",
    "名酒1",
    "名酒2",
    "名酒3",
    "名酒4",
    "名酒5",
    "名酒1",
    "名酒2",
    "名酒3",
    "名酒4",
    "名酒5"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570), //750-180
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal, //横向方向
        itemCount: RightList.length,
        itemBuilder: (context, index) {
          return _rightInkWell(RightList[index], index);
        },
      ),
    );
  }

  Widget _rightInkWell(String item, int index) {
    bool isActive = false;
    isActive = (index == activeId) ? true : false;
// isActive=(index==Provide.value<'范型名字'>(context).变量?"":"")

    return InkWell(onTap: () {
      setState(() {
        activeId = index;
      });
      
       print("点击了index===${item}");
    }, child:
        //    Provide<ProvideList>(
        //   builder: (context,child,data){
        //     print('data缓存的ID==${data.leftId}');
        //   },
        // );
        Provide<ProvideList>(
      builder: (context, build, data) {
        return Container(
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          child: Text(
            item,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: isActive ? Colors.red : Colors.black),
          ),
        );
      },
    ));
  }
}

// 右侧商品列表
class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key, listImage}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  // var listImage = [];
  EasyRefreshController _controller = EasyRefreshController();
  GlobalKey _headerKey = GlobalKey();
  GlobalKey _footerKey = GlobalKey();
  var scorllController=new ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ProvideList>(
      builder: (context, child, data) {
        // 如果列表变化大类了，就默认滚动到顶部
         try{
           if(Provide.value<ProvideList>(context).page==1){
            //  列表滚动到顶部
                scorllController.jumpTo(0.0);
                // 第一步 var scorllController=new ScrollController();
                // 第二步  controller: scorllController,//可以控制滚动
                // 第三步  scorllController.jumpTo(0.0); 
           }
         }catch(e){
          
          print('进入页面第一次${e}');
         }

        print("provide的数据==${data}=>");
        return Expanded(
          //解决ListView.builder高度溢出的bug
          child: Container(
            width: ScreenUtil().setWidth(570),
            // height: ScreenUtil().setHeight(1000),

            //  下拉加载更多部分开始
            child: EasyRefresh(
              header: ClassicalHeader(
                  key: _headerKey,
                  showInfo: false,
                  refreshText: '之前之前',
                  refreshReadyText: '正在准备刷新',
                  refreshedText: '刷新完成.....'),
              footer: ClassicalFooter(
                key: _footerKey,
                noMoreText: Provide.value<ProvideList>(context).noMoreText,//状态化
                // noMoreText: '没有更多文字',
                loadText: '提示加载文字.......',
                loadReadyText: '准备加载文字',
                loadingText: '正在加载文字',
                loadedText: '加载完成文字',
                loadFailedText: '加载失败文字',
                showInfo: false,
                infoText: '更多信息',
                bgColor: Colors.red,
                textColor: Colors.white,
                infoColor: Colors.blue,
              ),
              child: ListView.builder(
                controller: scorllController,//可以控制滚动
                itemCount: data.provideLists.length,
                itemBuilder: (context, index) {
                  return _listItemWidget(data.provideLists, index);
                },
              ),
              onRefresh: () async {
                print("滑动到顶部.......");
              },
              // 上拉加载更多
              onLoad: () async {
               
              var  id=  Provide.value<ProvideList>(context).leftId;
                 Provide.value<ProvideList>(context).addPage();
              var page=Provide.value<ProvideList>(context).page;   
                 _FenLeiRIGHTMoreList(id,page);
                print("上拉加载更多......");
              },
            ),
            //  下拉加载更多部分结束
          ),
        );
      },
    );
  }



  // 商品分类的右侧列表内容
  void _FenLeiRIGHTMoreList(int id, int page) async { 
    //直接获取Provide参数值 Provide.value<ProvideList>(context).leftId
    var parms = {'cargoId': id, 'pNum': page, 'pSize': 6};
    FenLeiRIGHTList(parms).then((val) {
         Provide.value<ProvideList>(context)
            .getMoreProvideListsAdd(val['data']['dataList'], id);

           print("右侧数据---->" +val['data']['dataList']);
  
      // if ( val['data']['dataList'].toString()==null) {
      //    Fluttertoast.showToast(
      //      msg: "已经到底了",
      //      toastLength: Toast.LENGTH_SHORT,
      //      gravity: ToastGravity.BOTTOM,
      //      backgroundColor: Colors.black45,
      //      textColor: Colors.white,
      //      fontSize: ScreenUtil().setSp(16),
           
      //    );
      //     Provide.value<ProvideList>(context).changeNoMore("没有更多的数据了哦");
      //   // Provide.value<ProvideList>(context).ProvideListsAdd([], 0);
      // } else {
      //   Provide.value<ProvideList>(context)
      //       .getMoreProvideListsAdd(val['data']['dataList'], id);
      // }
      // print("value====" + val['data']['zmCargoList'].toString());
    });
  }
  //  formData:data 可选参数
  // void _getGoodList(int id, int page) {
  //   var parms = {'cargoId': id, 'pNum': page, 'pSize': 6};
  //   FenLeiList(parms).then((val) {
  //     print("value====" + val.toString());
  //   });
  // }

// 商品图片
  Widget _goodsImage(List newList, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index]['listPhoto']),
    );
  }

// 商品名称
  Widget _gooodsName(List newList, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index]['goodsName'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

// 商品价格
  Widget _goodsPrice(List newList, index) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            "价格：￥${newList[index]['goodsSellingPrice']}",
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            "价格：￥${newList[index]['goodsSellingPrice']}",
            style: TextStyle(
              color: Colors.black12,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

// 合并商品图片 商品名称  商品价格
  Widget _listItemWidget(List newList, index) {
    return InkWell(
      onTap: () {
     
        print("商品列表哦---${newList[index]['goodsSpu']}-->");
        Application.router.navigateTo(context, '/DetailsPage?id=${newList[index]['goodsSpu']}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _gooodsName(newList, index),
                _goodsPrice(newList, index)
              ],
            )
          ],
        ),
      ),
    );
  }
}
