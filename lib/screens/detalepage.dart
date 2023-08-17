import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';

class DetilePage extends StatefulWidget {
  final int id;
  const DetilePage({super.key, required this.id});

  @override
  State<DetilePage> createState() => _DetilePageState();
}

class _DetilePageState extends State<DetilePage> {
  List<Plant> plant = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //appbar
            Positioned(
              right: 20.0,
              left: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.primeryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      plant[widget.id].isFavorated == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Constant.primeryColor,
                    ),
                  ),
                ],
              ),
            ),
            //info
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              top: 0.0,
              child: Container(
                padding: const EdgeInsets.all(0.0),
                width: size.width * 0.8,
                height: size.height * 0.8,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100.0,
                      right: 40.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          infoflower(
                            text: 'اندازه‌گیاه',
                            info: plant[widget.id].size,
                          ),
                          infoflower(
                            text: 'رطوبت‌هوا',
                            info: plant[widget.id].humidity.toString(),
                          ),
                          infoflower(
                            text: 'دمای‌نگهداری',
                            info: plant[widget.id].temperature,
                          ),
                        ],
                      ),
                    ),
                    //image plant
                    Positioned(
                      top: 100.0,
                      left: 30.0,
                      child: Image.asset(
                        plant[widget.id].imageURL,
                        height: 370.0,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: size.height * 0.42,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Constant.primeryColor.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 40.0,
                                top: 80.0,
                              ),
                              child: Text(
                                plant[widget.id].plantName,
                                style: TextStyle(
                                  fontFamily: 'Vazir',
                                  color: Constant.primeryColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 30.0,
                                    color: Constant.primeryColor,
                                  ),
                                  Text(
                                    plant[widget.id].rating.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Vazir',
                                      fontSize: 20.0,
                                      color: Constant.primeryColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(width: 180.0),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'assets/images/PriceUnit-green.png',
                                      height: 20.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: Text(
                                      plant[widget.id].price.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Vazir',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w900,
                                        color: Constant.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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

  infoflower({required text, required info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 18.0,
            color: Constant.blackColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 17.0,
            color: Constant.primeryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20.0)
      ],
    );
  }
}
