import 'dart:convert';
import 'package:flutter/material.dart';
import './provide_detail/provide_detail.dart';
import 'package:flutter_demo/config/ZMW_Config/ConfigurationInterface/ConfigurationInterface.dart';

class DetailsInfoProvide with ChangeNotifier {
  // DetailsModle   为模型层里面的变量
  DetailsModle goodsInfo = null;
  //  从后台获取数据，
  getGoodsInfo(String goodsId) {
    var formData = {'goodsSpu': goodsId};
    QUERYNEWDETAILSSPU(formData).then((val) {
      try {
      // var val1=  jsonDecode(val.toString());
        goodsInfo = DetailsModle.fromJson(val);
        //  DetailsModle.fromJson(val);
      } catch (e) {
        print('$e');
      }
       print('--->>>>$goodsInfo');
    });
      
    notifyListeners();
  }
}

// new DetailsModle()
