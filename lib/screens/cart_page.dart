import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';
import 'package:flutter_application_6/screens/widget/plantwidget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> listcart;
  const CartPage({
    super.key,
    required this.listcart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    sumprice() {
      int price = widget.listcart.length;
      int index = 0;

      for (int i = 0; i < price; i++) {
        index += widget.listcart[i].price;
      }
      return index.toString();
    }

    return Scaffold(
      body: widget.listcart.isNotEmpty
          ? Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.listcart.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 12.0, left: 12.0),
                          child: NewWidgetPlant(
                            plant: widget.listcart,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 20.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                  height: 20.0,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  sumprice(),
                                  style: TextStyle(
                                    fontFamily: 'Vazir',
                                    fontSize: 23.0,
                                    color: Constant.primeryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                            child: Text(
                              'جمع کل',
                              style: TextStyle(
                                fontFamily: 'Lalezar',
                                fontSize: 23.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/add-cart.png',
                    height: 100.0,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'سبد خرید را تار عنکبوت بسته :-|',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
