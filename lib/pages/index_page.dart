import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home_page.dart';
import './more_page.dart';
import './kaidan_page.dart';
import './custom_page.dart';
import './store_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// stful 快速生成动态组件
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(IconData(0xe720, fontFamily: 'MyIcon')), 
      title: Text('首页', style: TextStyle(fontSize: 12),)),
    BottomNavigationBarItem(icon: Icon(IconData(0xe6fe, fontFamily: 'MyIcon')),  title: Text('开单', style: TextStyle(fontSize: 12),)),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe7d1, fontFamily: 'MyIcon')), title: Text('库存', style: TextStyle(fontSize: 12),)),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe61f, fontFamily: 'MyIcon')), title: Text('客户', style: TextStyle(fontSize: 12),)),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe773, fontFamily: 'MyIcon')), title: Text('更多', style: TextStyle(fontSize: 12),)),
  ];


  final List<Widget> tabBodies = [
    HomePage(),
    KaidanPage(),
    StorePage(),
    CustomPage(),
    MorePage()
  ];
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1600)..init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              // bottomNavigationBarType 一般都是用fixed类型
              type: BottomNavigationBarType.fixed,
              fixedColor: Color.fromARGB(255, 116, 104, 242),
              currentIndex: currentIndex,
              items: bottomTabs,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  currentPage = tabBodies[currentIndex];
                });
              },
            ),
            body: IndexedStack(
              index: currentIndex,
              children: tabBodies,
            )),
      ),
    );
  }
}
