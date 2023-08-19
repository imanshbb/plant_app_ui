import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';
import 'package:flutter_application_6/screens/detailepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class NewWidgetPlant extends StatelessWidget {
  final List<Plant> plant;
  final int index;
  const NewWidgetPlant({
    super.key,
    required this.plant,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailePage(id: plant[index].plantId),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Container(
        height: 80.0,
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Constant.primeryColor.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                  child: Image.asset(
                    'assets/images/PriceUnit-green.png',
                    height: 20.0,
                  ),
                ),
                Text(
                  plant[index].price.toString(),
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    color: Constant.primeryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constant.primeryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 0.0,
                  left: 0.0,
                  child: Image.asset(
                    plant[index].imageURL,
                    height: 75.0,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        plant[index].category,
                        style: const TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        plant[index].plantName,
                        style: TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 18.0,
                          color: Constant.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
