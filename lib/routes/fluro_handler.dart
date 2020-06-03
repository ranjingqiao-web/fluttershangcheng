import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../qiaoList/pages/detail/details_page.dart'; //商品详情页
 

Handler detailsHandler=Handler(
     handlerFunc: (BuildContext context,Map<String ,List<String>>params){
       String goodsId=params['id'].first;
       print('---------------${goodsId}--------');
       return DetailsPage(goodsId);
     }
);


























