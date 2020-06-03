//  https://javiercbk.github.io/json_to_dart/   json转dart
import 'package:flutter/material.dart';
import 'qiaoList/pages/Tabs.dart';//底部导航部分
import 'routes/fluro_all.dart'; 
import 'routes/fluro_application.dart'; 
// import 'routes/Routes.dart'; 
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/childProvide.dart';
import './provide/provide_right_list.dart';
import './provide/provide_detail.dart';

import 'package:fluro/fluro.dart'; 
 
void main()  { 
  var counter=Counter();
  var providers=Providers();
  var childProvide=ChildProvide();
  var detailsInfoProvide=DetailsInfoProvide();
  var provideList=ProvideList();
    
   
  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ProvideList>.value(provideList))
  ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
  ..provide(Provider<ChildProvide>.value(childProvide));
  runApp(
  ProviderNode(
    child: new MyApp(),
    providers:providers
  ));
  } 

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // 路由静态化
    // import 'routes/fluro_all.dart'; 
    // import 'routes/fluro_application.dart';
    // final router =Router();
    // Routes.configureRoutes(router);
    // Application.router=router; 
    // onGenerateRoute:Application.router.generator,
    final router =Router();
    Routes.configureRoutes(router);
    Application.router=router;


    return MaterialApp(
      onGenerateRoute:Application.router.generator,
      localizationsDelegates: [ 
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en', ''),
          const Locale('zh', ''),
      ],
      debugShowCheckedModeBanner: false,//去掉右上角debug图标
      initialRoute: '/',//初始化加载页面
      home: PageBottomNavigationBar(),
      //  onGenerateRoute:onGenerateRoute
    );
  }
}
 