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

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10.0,
      width: isActive ? 20.0 : 8.0,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Constant.primeryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  List<Widget> _buildIndecator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (i == currentIndex) {
        indicators.add(indicator(true));
      } else {
        indicators.add(indicator(false));
      }
    }
    return indicators;
  }

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
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: <Widget>[
              //1
              CreatePage(
                title: Constant.titleOne,
                description: Constant.descriptionOne,
                image: 'plant-one.png',
              ),
              //2
              CreatePage(
                title: Constant.titleTow,
                description: Constant.descriptionTow,
                image: 'plant-two.png',
              ),
              //3
              CreatePage(
                title: Constant.titleTree,
                description: Constant.descriptionTree,
                image: 'plant-three.png',
              ),
            ],
          ),
          Positioned(
            bottom: 50.0,
            left: 10.0,
            child: Row(
              children: _buildIndecator(),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image',
            height: 400,
          ),
          const SizedBox(height: 15.0),
          Text(
            title,
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
            description,
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
    );
  }
}
