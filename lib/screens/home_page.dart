import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'رد کردن',
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/plant-one.png',
                  height: 400,
                ),
                const SizedBox(height: 15.0),
                Text(
                  Constant.titleOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Constant.primeryColor,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  Constant.descriptionOne,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
