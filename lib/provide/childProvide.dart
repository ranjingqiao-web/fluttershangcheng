import 'package:flutter/material.dart';

class ChildProvide with ChangeNotifier{
  List  childProvideList=[];
  getChildList(List list){
    childProvideList=list;
    notifyListeners();
  }
}