import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/screens/Cart_Page.dart';
import 'package:flutter_application_6/screens/Favorit_Page.dart';
import 'package:flutter_application_6/screens/home_page.dart';
import 'package:flutter_application_6/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.people,
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
        leading: Icon(
          Icons.notifications,
          color: Constant.blackColor,
          size: 50.0,
        ),
        title: Text(
          appBarTitle[pageIndex],
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 45.0,
          ),
        ),
      ),
    );
  }
}
