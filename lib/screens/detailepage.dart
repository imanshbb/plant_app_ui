import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';
import 'package:flutter_application_6/screens/cart_page.dart';

import 'package:page_transition/page_transition.dart';

class DetailePage extends StatefulWidget {
  final int id;
  const DetailePage({super.key, required this.id});

  @override
  State<DetailePage> createState() => _DetailePageState();
}

class _DetailePageState extends State<DetailePage> {
  List<Plant> plant = Plant.plantList;
  addToCart(cart) {
    return !cart;
  }

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
                    //image plant
                    Positioned(
                      top: 80.0,
                      left: 40.0,
                      child: Image.asset(
                        plant[widget.id].imageURL,
                        height: 350.0,
                      ),
                    ),
                    //text info
                    Positioned(
                      top: 80.0,
                      right: 40.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantInfo(
                            text: 'اندازه‌گیاه',
                            info: plant[widget.id].size,
                          ),
                          PlantInfo(
                            text: 'رطوبت‌هوا',
                            info: plant[widget.id].humidity.toString(),
                          ),
                          PlantInfo(
                            text: 'دمای‌نگهداری',
                            info: plant[widget.id].temperature,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //plant category
            Positioned(
              bottom: 0.0,
              child: Container(
                height: size.height * 0.47,
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
                        right: 30.0,
                        top: 50.0,
                      ),
                      child: Text(
                        plant[widget.id].plantName,
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          color: Constant.primeryColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
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
                                fontSize: 24.0,
                                fontWeight: FontWeight.w900,
                                color: Constant.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 23.0,
                        left: 23.0,
                        top: 20.0,
                      ),
                      child: Text(
                        plant[widget.id].decription,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.8,
                          fontFamily: 'IranSans',
                          color: Constant.blackColor.withOpacity(0.8),
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
      //button bottom
      floatingActionButton: SizedBox(
        height: 50.0,
        width: size.width * 0.9,
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constant.primeryColor.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.1),
                    blurRadius: 0.5,
                    color: plant[widget.id].isSelected == true
                        ? Constant.primeryColor
                        : Constant.primeryColor.withOpacity(0.2),
                  ),
                ],
              ),
              child: InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: CartPage(listcart: Plant.addedToCartPlants()),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                //state shop button
                child: Stack(
                  children: [
                    const Positioned(
                      bottom: 12.0,
                      right: 12.0,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: plant[widget.id].isSelected == true ? 5.0 : 4.0,
                      child: Text(
                        plant[widget.id].isSelected == true ? '1' : '0',
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          fontSize: 30.0,
                          color: plant[widget.id].isSelected == true
                              ? Colors.black
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            //add to shop button
            Expanded(
              child: InkResponse(
                onTap: () {
                  setState(
                    () {
                      //add to cart page code
                      final added =
                          addToCart(Plant.plantList[widget.id].isSelected);
                      Plant.plantList[widget.id].isSelected = added;
                      //end add to cart page code

                      //ScaffoldMessengertext:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SnackBarAction(
                                textColor: Constant.primeryColor.withOpacity(1),
                                label: 'Action',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  plant[widget.id].isSelected == true
                                      ? 'به سبد خرید اضافه شد'
                                      : 'از سبد خرید حذف شد',
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(fontFamily: 'Lalezar'),
                                ),
                              ),
                            ],
                          ),
                          duration: const Duration(milliseconds: 1500),
                          width: 280.0, // Width of the SnackBar.
                          padding: const EdgeInsets.symmetric(
                            horizontal:
                                8.0, // Inner padding for SnackBar content.
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                      //end ScaffoldMessenger
                    },
                  );
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Constant.primeryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.0, 1.1),
                        blurRadius: 0.5,
                        color: Constant.primeryColor.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'افزودن‌ ‌به‌ سبد خرید',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantInfo extends StatelessWidget {
  final String text;
  final String info;
  const PlantInfo({
    super.key,
    required this.text,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 20.0,
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
          // const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
