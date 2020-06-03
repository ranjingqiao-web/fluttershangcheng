import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_demo/ranHero/ranHero.dart';
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart'; //下拉加载更多
// import 'package:flutter_easyrefresh/material_header.dart';
// import 'package:flutter_easyrefresh/material_footer.dart';

class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({Key key}) : super(key: key);

  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int page = 1; //页数
  List<Map> hotGoodsList = []; //火爆专区列表
//触发刷新和加载动作
  EasyRefreshController _controller = EasyRefreshController();
  GlobalKey _headerKey = GlobalKey();
  GlobalKey _footerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _getHotGoods();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("品牌馆"),
      ),
      body: new EasyRefresh(
        header: ClassicalHeader(
            key: _headerKey,
            showInfo: false,
            refreshText: '之前之前',
            refreshReadyText: '正在准备刷新',
            refreshedText: '刷新完成.....'),
        footer: ClassicalFooter(
          key: _footerKey,
          noMoreText: '没有更多文字',
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

        // 控制加载和刷新完成
        // enableControlFinishRefresh: true,
        // enableControlFinishLoad: true,

        controller: _controller,
        child: _hotGoods(),
        onRefresh: () async {
          print("滚动到顶部................");
          var parmas = {"pSize": 10, "pNum": 1, "roleId": 5, "userCode": ""};
          QUERYNEWQUERYNEWPRODUCTS(parmas).then((val) {
            var data = val;
            //新列表，要把新列表加在老列表里面
            //  List<Map> newGoodsList = data.map((data){return data['data']['goods'];}).toList();
            List<Map> newGoodsList = (data['data']['goods'] as List).cast();
            print("滚动到顶部列表------------->" + data.toString());
            setState(() {
              hotGoodsList:
              newGoodsList;
            });
          });
        },
        onLoad: () async {
          print("加载更多................");
          var parmas = {"pSize": 10, "pNum": page, "roleId": 5, "userCode": ""};
          QUERYNEWQUERYNEWPRODUCTS(parmas).then((val) {
            var data = val;
            //新列表，要把新列表加在老列表里面
            //  List<Map> newGoodsList = data.map((data){return data['data']['goods'];}).toList();
            List<Map> newGoodsList = (data['data']['goods'] as List).cast();
            print("加载更多列表------------->" + data.toString());

            setState(() {
              hotGoodsList.addAll(newGoodsList);
              page++;
            });
          });
        },
      ),
    );
  }

  // 获取下拉加载更多列表
  void _getHotGoods() {
    var parmas = {"pSize": 10, "pNum": 1, "roleId": 5, "userCode": ""};
    QUERYNEWQUERYNEWPRODUCTS(parmas).then((val) {
      // var data = jsonDecode(val.toString());
      var data = val;
      //新列表，要把新列表加在老列表里面
      //  List<Map> newGoodsList = data.map((data){return data['data']['goods'];}).toList();

      List<Map> newGoodsList = (data['data']['goods'] as List).cast();
      print("推荐列表------------->" + data.toString());
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  // 布局列表，这是变量的形式
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center, //居中对齐
    color: Colors.transparent, //背景透明色
    padding: EdgeInsets.all(5.0),
    child: Text('火爆专区'),
  );
  // 流失布局
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      // 流式布局==>把map类型的hotGoodsList转换成Widget类型的格式数据
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['listPhoto'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  val['goodsName'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, //超过一行用省略号
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['goodsSellingPrice']}'),
                    Text(
                      '￥${val['unitName']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      // 流式布局必须返回，return，
      return Wrap(
        spacing: 2, //两列
        children: listWidget,
      );
    } else {
      // 没有数据的时候我们要返回一个数据
      return Text('暂无数据');
    }
  }

  // 列表和标题进行组合
  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _wrapList()],
      ),
    );
  }
}

class ClassicsHeader {}

class RefreshHeaderState {}

mixin RefreshFooterState {}

class EasyRefreshState {}
