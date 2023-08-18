import 'package:flutter/material.dart';

import 'package:flutter_application_6/models/plant.dart';

import 'package:flutter_application_6/screens/widget/palntWidget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> listfavorit;
  const FavoritePage({
    super.key,
    required this.listfavorit,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List<Plant> plant = widget.listfavorit;

    return Scaffold(
      body: plant.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.listfavorit.length,
              itemBuilder: (context, index) {
                return NewWidgetPlant(plant: plant, index: index);
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/favorited.png',
                    height: 100.0,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'ظاهراً به هیچی علاقه نداشتی :-|',
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
