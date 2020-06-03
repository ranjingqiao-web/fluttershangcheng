
// SingleChildScrollView  解决屏幕键盘自动弹出，超出范围报错问题 不与listView合用
// FutureBuilder 使用此组件就不需要用setData去动态改变数据
// ScreenUtil().setSp(28,false) 字体大小不会随着屏幕字体大小改变
// this.allList.removeRange(10,this.allList.length);删除allList第10条数据后面的所有数据
//设置边缘角   ClipRRect(borderRadius: BorderRadius.circular(10),)
// 拨打电话组件 url_launcher: ^5.2.7    https://pub.dev/packages/url_launcher
//超出一行显示省略号  maxLines: 1,overflow: TextOverflow.ellipsis,
//  页面保持原来的数据，同时不重新请求接口   
        // 第一点：  with  AutomaticKeepAliveClientMixin  
        // 第二点： @override
        // bool get wantKeepAlive=>true
        //  第三点要加Widget，不然会报错：
          // List<Widget> _pageList = [
                  //   HomePage(),
                  //   ClassifiAationPage(),
                  //   BrandHallPage(),
                  //   ShoppingListPage(),
                  //   MinePage(),
                  // ];
        // 第四点，引入IndexedStack,接收两个参数index和children：
          //  body: IndexedStack(
            //   index:_currentIndex,
            //   children:_pageList,
            // ),
  // GridView.count(
  //       physics: NeverScrollableScrollPhysics(),   加上这句话就是禁止  GridView 滚动


  // Expanded(//解决ListView.builder高度溢出的bug
  //           child:   Container(
  //         width: ScreenUtil().setWidth(570),
  //         // height: ScreenUtil().setHeight(1000),
  //         child: ListView.builder(
  //           itemCount:  data.provideLists.length,
  //           itemBuilder: (context, index) {
  //             return _listItemWidget( data.provideLists, index);
  //           },
  //         ),
  //       ),
  //       );

  // provide 1.0.2  状态管理组件
//  lib\qiaoList\pages\Tabs.dart   里面配置 ScreenUtil.instance=ScreenUtil(width:750,height:1334)..init(context);表示全局配置，其它页面就可以直接使用
// D:\flutter\zhaomen\zm_sc\android\app\src\main\AndroidManifest.xml // 安卓打包加载不出图片，请求网络失败问题
// D:\flutter\zhaomen\zm_sc\android\app\src\profile\AndroidManifest.xml// 安卓打包加载不出图片，请求网络失败问题
// <uses-permission android:name="android.permission.READ_PHONE_STATE" />
// <uses-permission android:name="android.permission.INTERNET" />
// <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
// <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />


















































