import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/screens/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 9.0,
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
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              child: const Text(
                'رد کردن',
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 16,
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
            left: 15.0,
            child: Row(
              children: _buildIndecator(),
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 25.0,
            child: Container(
              decoration: BoxDecoration(
                color: Constant.primeryColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  onPressed: () {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RootPage();
                          },
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
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
            height: 390,
          ),
          const SizedBox(height: 15.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 23.0,
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
