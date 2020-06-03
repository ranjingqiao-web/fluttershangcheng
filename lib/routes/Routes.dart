import 'package:flutter/material.dart';
import '../qiaoList/pages/Tabs.dart';//底部导航部分
import '../qiaoList/pages/pages/search.dart'; //搜索页面
// import '../qiaoList/pages/CommPage/Form.dart';
// import '../qiaoList/pages/CommPage/Search.dart';
// import '../qiaoList/pages/CommPage/Login.dart';
// import '../qiaoList/pages/CommPage/Registreone.dart';
// import '../qiaoList/pages/CommPage/Registreonetwo.dart';
// import '../qiaoList/pages/CommPage/Registreonethere.dart';
// import '../qiaoList/pages/CommPage/TabController.dart';
// import '../qiaoList/pages/CommPage/Yonghuzhognxin.dart';
// import '../qiaoList/pages/CommPage/Buttomyanshiyemian.dart';
// import '../qiaoList/pages/CommPage/TextField.dart'; 
// import '../qiaoList/pages/CommPage/AppBarDemo.dart';
// import '../qiaoList/pages/CommPage/RadioSwitch.dart';
// import '../qiaoList/pages/detail/Detail.dart';
 
 

// import '../qiaoList/pages/Commom/FormSexSwitch.dart';
// import '../qiaoList/pages/Commom/DatePicker.dart';
// import '../qiaoList/pages/Commom/flutter_cupertino_date_picker.dart';
// import '../qiaoList/pages/Commom/flutter_swiper.dart';
// import '../qiaoList/pages/Commom/AlertDialog.dart';
   
final routes = {
  '/': (context, {arguments}) => PageBottomNavigationBar(),
  '/search': (context, {arguments}) => searchPage(),
  // '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  // '/DetailPage': (context, {arguments}) => DetailPage(arguments: arguments),
  // '/TabBarControllerPage': (context, {arguments}) => TabBarControllerPage(), //自定义导航页面
  // '/YonghuzhognxinPage': (context, {arguments}) => YonghuzhognxinPage(), //用户中心页面
  // '/ButtomyanshiyemianPage': (context, {arguments}) => ButtomyanshiyemianPage(), //按钮详解页面
  // '/TextFieldPage': (context, {arguments}) => TextFieldPage(), //表单组件页面 
  // '/RadioSwitchPage': (context, {arguments}) => RadioSwitchPage(),  
  // '/AppBarDemoPage': (context, {arguments}) => AppBarDemoPage(),
  // '/LoginPage': (context, {arguments}) => LoginPage(),
  // '/RegistreonePage': (context, {arguments}) => RegistreonePage(),
  // '/RegistretwoPage': (context, {arguments}) => RegistretwoPage(),
  // '/RegistreonetherePage': (context, {arguments}) => RegistreonetherePage(),
  // '/FormSexSwitchPage': (context, {arguments}) => FormSexSwitchPage(),//注册登记表单组件
  // '/DatePickerPage': (context, {arguments}) => DatePickerPage(),//时间日期组件
  // '/flutter_cupertino_date_pickerPage': (context, {arguments}) => flutter_cupertino_date_pickerPage(),//时间日期组件
  // '/flutter_swiperPage': (context, {arguments}) => flutter_swiperPage(),//时间日期组件
  // '/AlertDialogPage': (context, {arguments}) => AlertDialogPage(),//提示框 toast
 
}; 

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
