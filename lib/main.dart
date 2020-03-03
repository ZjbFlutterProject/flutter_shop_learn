import 'dart:io';
import 'package:flutter/material.dart'; // 是由谷歌推出的 提供一致外观
import 'package:flutter/cupertino.dart'; // 使用苹果手机 很友好ios的风格
import 'package:flutter/services.dart';
// 到底选用哪种风格 两种风格都可以引入
import './pages/index_page.dart';

void main() {
  runApp(MyApp());
   if(Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


// stlss 快速生成类继承StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 做项目的时候 外面加个container 使以后扩展容易
    return Container(
        child: MaterialApp(
            title: '云衣库优选',
            // 当为true时，在debug模式下显示右上角的debug字样的横幅，false即为不显示
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.lightBlue,
              // scaffoldBackgroundColor: Colors.lightGreen
            ),
            home: IndexPage()));
  }
}
