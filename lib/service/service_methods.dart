import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// 获取首页商品列表
Future getProductList() async{
  print('开始获取首页商品列表------------------------');
  Response response;
  Dio dio = new Dio();
  dio.options.contentType = Headers.formUrlEncodedContentType;
  var formData = {'lon': '115.02932', 'lat': '35.76189'};
  response = await dio.post(servicePath['productList']);
}