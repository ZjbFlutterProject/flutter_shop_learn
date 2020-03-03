import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KaidanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    print(1111);
    print(statusBarHeight);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: _PageTitle(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _Settlement()
          )
          
        ],
      ),
    );
  }
  Widget _Settlement() {
    return Container(
      
    );
  }

  Widget _PageTitle() {
    return Container(
        height: ScreenUtil().setHeight(84),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: ScreenUtil().setSp(2), color: Color.fromARGB(255, 224, 224, 224))
          )
        ),
        padding: EdgeInsets.only(top: ScreenUtil().setSp(15)),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(750),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              // top: ScreenUtil().setSp(15),
              right: 0,
              child: Text('销售开单',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: (){
                  print("不要点我。。。");
                },
                child: Container(
                  width: ScreenUtil().setWidth(100),
                  alignment: Alignment.center,
                  child: Text(
                  '重置',
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontSize: ScreenUtil().setSp(28)
                  ),
                ),
                ),
              ),
            )
          ],
        ));
  }
}
