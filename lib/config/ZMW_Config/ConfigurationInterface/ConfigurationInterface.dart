import 'package:flutter_demo/ranHero/ranHero.dart';
import 'package:flutter_demo/config/ZMW_Config/JQ_ConfigurationInterface/JQ_ConfigurationInterface.dart';

//  下拉加载更多列表
  Future QUERYNEWQUERYNEWPRODUCTS(parmes) async {
  
    var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_QUERYNEWPRODUCTS, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
  }
 
//  banner列表
  Future LunBoList(parmes) async {
  
    var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_LUNBO, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
  }
 
//  搜索页面接口
  Future SeachGetListAll(parmes) async {
  
    var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_PRODUCTS, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
  }
  
//  分类左侧列表
  Future FenLeiList(parmes) async {
  
    var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_FENLEILIST, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
  }
  //  分类右侧列表
  Future FenLeiRIGHTList(parmes) async {
  
    var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_RIGHTLIST, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
  }
   
// 商品详情页面

Future QUERYNEWDETAILSSPU(parmes) async {
  var result = await ZhaoMenWangHttpUtils.request(
        ZHAOMENWANG.QUERYNEW_DETAILS_SPU, 
        method: ZhaoMenWangHttpUtils.POST,
        data: parmes); 
    return result;
}
  //  QUERYNEW_DETAILS_SPU