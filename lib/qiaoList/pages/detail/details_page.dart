import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';
import 'package:provide/provide.dart';
import '../../../provide/provide_detail.dart';

// QUERYNEWDETAILSSPU
class DetailsPage extends StatelessWidget {
  // 此定义就能接收到数据
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    // Provide.value<DetailsInfoProvide>(context).
    //  Map<String, dynamic> user =convert.jsonDecode(goodsId);
    //    var jjjj={'goodsSpu': goodsId};
    //  QUERYNEWDETAILSSPU(jjjj).then((val){
    //    print("rrrrrrrrrrrrrrrrrrr${val.toString()}rrrrrrrrrrrrrrrrrrrrrrrrrrr");
    //  });

    //  print("创参数返回数据${Provide.value<DetailsInfoProvide>(context).goodsInfo}");
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("详情"),
        ),
        body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Provide<DetailsInfoProvide>(
                      builder: (context, child, val) {
                        var goodsInfoList =
                            Provide.value<DetailsInfoProvide>(context)
                                .goodsInfo
                                .data
                                .goods;
                        var _jsonList = goodsInfoList.map((obj){
                          return obj.toJson();
                        });
                        print('$_jsonList 这样取出来能循环吗 你是要数组么，嗯。拿到数组，再循环显示这样取出来能循环吗 你是要数组么，嗯。拿到数组，再循环显示');
                            // 这样取出来能循环吗 你是要数组么，嗯。拿到数组，再循环显示
                        ///你要输出啥 就改成啥 具体里面的内容 不是model 其实 这一步是没必要的 你要是想循环展示 直接在遍历的方法里面 toJson就行，用listView 传index就行了
                        print("图片加${_jsonList}载。。。。");
                        if (_jsonList != null) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[Text("7777${_jsonList}a")],
                            ),
                          );
                        } else {
                          return Text("正在加载中.....");
                        }
                      },
                    )
                    // Text("wwww${Provide.value<DetailsInfoProvide>(context).goodsInfo}"),
                  ],
                ),
              );
            } else {
              Text("加載中.........");
            }
          },
        ));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return "完成加載";
  }
}

// Container(
//        child: Center(
//          child: Text('${Provide.value<DetailsInfoProvide>(context).goodsInfo}'),
//        ),
//     ),

// https://www.bilibili.com/video/av52265148/?redirectFrom=h5
