import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';

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
          ],
        ),
      ),
    );
  }
}
