import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectindex = 0;

  List<String> plantType = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل کار |',
    '| گل باغچه ای |',
    '| گل سمی |',
  ];
  List<Plant> plant = Plant.plantList;
  bool isFavorit1(favorit) {
    return !favorit;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //search
            Center(
              child: Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constant.primeryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      showCursor: false,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'جستجو...',
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Constant.blackColor.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Constant.blackColor.withOpacity(0.5),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // category
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: size.width * 0.9,
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: plantType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectindex = index;
                        });
                      },
                      child: Text(
                        plantType[index],
                        style: TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 16.0,
                          fontWeight: selectindex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectindex == index
                              ? Constant.primeryColor
                              : Constant.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //product One

            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: plant.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200.0,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Constant.primeryColor.withOpacity(0.8),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10.0,
                          right: 20.0,
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorit1(plant[index].isFavorated);
                                });
                              },
                              icon: Icon(
                                plant[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 20.0,
                              ),
                              color: Constant.primeryColor,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 50.0,
                          left: 50.0,
                          right: 50.0,
                          top: 50.0,
                          child: Image.asset(plant[index].imageURL),
                        ),
                        Positioned(
                          bottom: 15.0,
                          left: 20.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 2.0,
                              ),
                              child: Text(
                                r'$' + plant[index].price.toString(),
                                style: TextStyle(
                                  color: Constant.primeryColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15.0,
                          right: 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                plant[index].category,
                                style: const TextStyle(
                                  fontFamily: 'Vazir',
                                  fontSize: 14.0,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                plant[index].plantName,
                                style: const TextStyle(
                                  fontFamily: 'Vazir',
                                  fontSize: 16.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
