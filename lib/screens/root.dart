import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';
import 'package:flutter_application_6/screens/Cart_Page.dart';
import 'package:flutter_application_6/screens/Favorit_Page.dart';
import 'package:flutter_application_6/screens/home_page.dart';
import 'package:flutter_application_6/screens/profile_page.dart';
import 'package:flutter_application_6/screens/scan_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;

  List<Plant> favorits = [];
  List<Plant> carts = [];
  List<Widget> pages() {
    return [
      const HomePage(),
      FavoritePage(listfavorit: favorits),
      CartPage(listcart: carts),
      const ProfilePage(),
    ];
  }

  List<IconData> icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.account_circle_rounded,
  ];

  List<String> appBarTitle = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.notifications,
              color: Constant.blackColor,
              size: 35.0,
            ),
            Text(
              appBarTitle[pageIndex],
              style: TextStyle(
                fontFamily: 'Vazir',
                fontSize: 25.0,
                color: Constant.blackColor,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: pages(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constant.primeryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        splashColor: Constant.primeryColor,
        activeColor: Constant.primeryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
            favorits = Plant.getFavoritedPlants().toSet().toList();
            carts = Plant.addedToCartPlants().toSet().toList();
          });
        },
      ),
    );
  }
}
