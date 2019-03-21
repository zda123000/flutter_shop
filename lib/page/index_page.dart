import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // IOS风格
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  final List<Widget> tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int currentIndex = 0; // 当前选中项 index
  var currentPage; //选中的页面

  @override
  void initState() {
    // TODO: 默认选中项
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
      ..init(context); //初始化设计尺寸（IP6大小）
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //样式
          currentIndex: currentIndex,
          items: bottomTabs, // 上面定义的导航的List
          onTap: (index) {
            // 单击事件（回调传递索引）
            setState(() {
              //动态组件改变里面的样式
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodies,
        )
        //currentPage,
        );
  }
}
