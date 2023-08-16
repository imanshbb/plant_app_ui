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
