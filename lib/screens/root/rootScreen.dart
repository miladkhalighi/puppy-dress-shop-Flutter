
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

  List<Widget> screens =  [
    const HomeScreen(),
    ////////////////////////////////// todo : replace with other screens
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: GradientColors.bgHomeGradient)
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Container(
              padding: const EdgeInsets.all(32),
              color: Colors.orange.withOpacity(0.3),
              child: const Text('Not implement yet',style: TextStyle(fontSize: 20,color: Colors.orange),)),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: GradientColors.bgHomeGradient)
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Container(
              padding: const EdgeInsets.all(32),
              color: Colors.pink.withOpacity(0.3),
              child: const Text('Not implement yet',style: TextStyle(fontSize: 20,color: Colors.pink),)),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: GradientColors.bgHomeGradient)
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Container(
              padding: const EdgeInsets.all(32),
              color: Colors.deepPurple.withOpacity(0.3),
              child: const Text('Not implement yet',style: TextStyle(fontSize: 20,color: Colors.deepPurple),)),
        ),
      ),
    ),
    ////////////////////////////////////
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: Colors.black45,
        textStyle: const TextStyle(fontSize: 14),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.send),
        title: ("Share"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: Colors.black45,
        textStyle: const TextStyle(fontSize: 14),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_balance_wallet_sharp),
        title: ("Cart"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: Colors.black45,
        textStyle: const TextStyle(fontSize: 14),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: SolidColors.red,
        activeColorSecondary: SolidColors.white,
        inactiveColorPrimary: Colors.black45,
        textStyle: const TextStyle(fontSize: 14),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
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
      ),
    );
  }
}
