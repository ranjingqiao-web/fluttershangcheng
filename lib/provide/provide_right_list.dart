import 'package:flutter/material.dart';

class ProvideList with ChangeNotifier {
  List provideLists = [];
  int leftId = 0;
  int page = 1; //页码
  String noMoreText = ""; //显示没有数据的名字
  provideListsAdd(List arr, int id) {
    page = 1; //只要切换大类，page初始化为1
    noMoreText = "";
    provideLists = [];
    leftId = id;
    provideLists = arr;
    notifyListeners();
  }

  getMoreProvideListsAdd(List arr, int id) {
    leftId = id;
    provideLists.addAll(arr);
    notifyListeners();
  }
  // 改变子类索引
//   changeChildIndex(index,int id){
//     page=1;//只要切换大类，page初始化为1
//     noMoreText="";
//     childIndex=index;
//     subId=id;
//     notifyListeners();
//  }

// 下拉增加page的方法
  addPage() {
    page++;
  }

// 改变没有数据时候的noMoreText显示内容
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
