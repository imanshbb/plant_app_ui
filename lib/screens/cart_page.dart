import 'package:flutter/material.dart';

import 'package:flutter_application_6/models/plant.dart';

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
    return Scaffold(
      body: Container(),
    );
  }
}
