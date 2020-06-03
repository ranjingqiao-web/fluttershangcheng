import 'package:flutter/material.dart'; 
import 'package:provide/provide.dart';
import '../provide_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsTopArea extends StatelessWidget {
  const DetailsTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
          builder:(context,child,val){
            var goodsInfo=Provide.value<DetailsInfoProvide>(context).goodsInfo.data; 
            print("图片加${goodsInfo}载。。。。");
            if(goodsInfo!=null){
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                    Text("7777${goodsInfo}a")
                ],
              ),
            );
            }else{
              return Text("正在加载中.....");
            }
          },
    ) ;
  }
  // 顶部商品图片
  Widget _goodsImage(url){
    return Image.network(
      url,
      width: ScreenUtil().setWidth(750),

    );
  }
  // 商品名称
  Widget _goodsName(name){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 10.0),
      child: Text(name,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(30),
        
      ),
      ),
    );
  }
  // 商品编号
  Widget _goodsNum(num){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text("编号${num}",
       style:TextStyle(
        color: Colors.black12
      )
      ),
      
    );
  }


}