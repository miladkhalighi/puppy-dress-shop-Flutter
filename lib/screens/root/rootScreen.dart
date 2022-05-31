
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:puppy_shop/colors.dart';
import 'package:puppy_shop/screens/home/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  int _bottomNavIndexSelected = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: _bottomNavIndexSelected);
  }

  List<Widget> screens = const [
    HomeScreen(),
    Center(
      child: Text('screen 2'),
    ),
    Center(
      child: Text('screen 3'),
    ),
    Center(
      child: Text('screen 4'),
    ),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/home.svg',color: SolidColors.white,),
        title: ("Home"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: SolidColors.green,
        textStyle: const TextStyle(fontSize: 14),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/EmailSend.svg',color: SolidColors.white,),
        title: ("Share"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/Vector.svg',color: SolidColors.white,),
        title: ("Cart"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/Person.svg',color: SolidColors.white,),
        title: ("Profile"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: screens,
        decoration: NavBarDecoration(
          colorBehindNavBar: SolidColors.scaffoldBgColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: GradientColors.bottomNavGradient
          )
        ),
        items: _navBarsItems(),
        confineInSafeArea: true,
      navBarHeight: 64,
      navBarStyle: NavBarStyle.style10,
      onItemSelected: (index){
          setState(()=> _bottomNavIndexSelected = index);
      },
    );
  }
}
