import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/screens/camera_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:page_transition/page_transition.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //appbar
            Positioned(
              right: 20.0,
              left: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // X icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constant.primeryColor.withOpacity(0.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constant.primeryColor,
                      ),
                    ),
                  ),
                  //share icon
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.primeryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.share,
                      color: Constant.primeryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const Camera(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 100.0,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      'برای اسکن گیاهان، کلیک کنید',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        color: Constant.primeryColor.withOpacity(0.8),
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
