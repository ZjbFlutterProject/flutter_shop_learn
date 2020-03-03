import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../config/http_header.dart';
import '../config/service_url.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(top: 0, left: 0, child: _HomeTitle('测试商户')),
        Positioned(
          top: 60,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              height: 2000,
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  _BasicInfo(),
                  _Title('商品管理'),
                  _GoodsManage(),
                  _Title('销售管理'),
                  _SaleManage(),
                  _Title('客户管理'),
                  _CustomManage(),
                  _Title('库存管理'),
                  _StoreManage()
                ],
              ))),
        )
      ],
    );
  }

  Widget _GoodsManage() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setSp(20), left: ScreenUtil().setSp(30)),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _GetItem('images/splb.png', '商品列表'),
          _GetItem('images/xzsp.png', '新增商品'),
        ],
      ),
    );
  }

  Widget _SaleManage() {
     return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setSp(20), left: ScreenUtil().setSp(30)),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _GetItem('images/ddls.png', '订单流水'),
          _GetItem('images/sxkd.png', '销售开单'),
          _GetItem('images/gdlb.png', '挂单列表'),
        ],
      ),
    );
  }

  Widget _CustomManage() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setSp(20), left: ScreenUtil().setSp(30)),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _GetItem('images/khlb.png', '客户列表'),
          _GetItem('images/xzkh.png', '新增客户')
        ],
      ),
    );
  }

  Widget _StoreManage() {
      return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setSp(20), left: ScreenUtil().setSp(30)),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _GetItem('images/kclb.png', '库存列表'),
          _GetItem('images/cgrk.png', '采购入库')
        ],
      ),
    );
  }

  Widget _GetItem(url, title){
    return Container(
      padding: EdgeInsets.only(right: ScreenUtil().setSp(87)),
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
            msg: "尚未开发",
            toastLength: Toast.LENGTH_LONG, // 轻提示插件的大小
            gravity: ToastGravity.CENTER, // 提示的位置
            backgroundColor: Colors.black, // 背景颜色
            textColor: Colors.white, // 文字颜色
            fontSize: 14.0
          );
        },
        child: Column(
          children: <Widget>[
            Image.asset(url, width: ScreenUtil().setSp(100),height: ScreenUtil().setSp(100)),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setSp(12)),
              child: Text(title, style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color.fromARGB(255, 51, 51, 51)
              ),)
            )
          ],
        ),
      )
    );
  }

  Widget _Title(title){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: ScreenUtil().setSp(60),left: ScreenUtil().setSp(30)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 51, 51, 51)
        )
      ),
    );
  }

  Widget _BasicInfo() {
    return Container(
      width: ScreenUtil().setWidth(710),
      height: ScreenUtil().setHeight(190),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 181, 175, 244),
        border: Border.all(width: 1, color: Color.fromARGB(255, 116, 104, 242)),
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(16)))
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(130),
            height: ScreenUtil().setHeight(40),
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setSp(20)
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 116, 104, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil().setSp(16)),
                  bottomRight: Radius.circular(ScreenUtil().setSp(16)),
                )
            ),
            child: Center(
              child: Text(
                '基础信息',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(24)
                )
              ),
            ),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(235),
              height: ScreenUtil().setHeight(100),
               decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: ScreenUtil().setSp(2), color: Color.fromARGB(150, 116, 104, 242))
                  )
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Text('0.00', style: TextStyle(
                     fontSize: ScreenUtil().setSp(46),
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255,51, 51,51)
                   ),),
                   Text('今日销售额')
                 ],
              )
            ),
             Container(
                width: ScreenUtil().setWidth(235),
                height: ScreenUtil().setHeight(100),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: ScreenUtil().setSp(2), color: Color.fromARGB(150, 116, 104, 242))
                  )
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Text('813182.00', style: TextStyle(
                     fontSize: ScreenUtil().setSp(46),
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255,51, 51,51)
                   ),),
                   Text('本月销售额')
                 ],
              )
            ),
             Container(
                width: ScreenUtil().setWidth(235),
                
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                 Text('201939', style: TextStyle(
                     fontSize: ScreenUtil().setSp(46),
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255,51, 51,51)
                   ),),
                   Text('累计库存')
                 ],
              )
            )
          ],
        )
        ],
      )
    );
  }

  Widget _HomeTitle(title) {
    return Container(
        padding: EdgeInsets.only(bottom: 12.0),
        width: ScreenUtil().setWidth(750),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Text(title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Color.fromARGB(255, 51, 51, 51),
                fontWeight: FontWeight.bold,
              )),
        )

        // color: Color.fromARGB(255, 51, 51, 51)
        );
  }
}
