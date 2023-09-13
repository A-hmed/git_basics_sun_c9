import 'package:flutter/material.dart';
import 'package:sun_flutter_basics/model/home_item_dm.dart';
import 'package:sun_flutter_basics/ui/home/home_item.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home";

  HomeScreen({Key? key}) : super(key: key);

  List<HomeItemDM> items = [
    HomeItemDM(title: "Cars", imagePath: "assets/images/car.jpg"),
    HomeItemDM(title: "Health", imagePath: "assets/images/health.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App bar title"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 4),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.purple,
                      child: Text(
                        "News",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 4),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.purple,
                      child: Text("Magazine",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) => HomeItem(
                        model: items[index],
                      )),
            )
          ],
        ));
  }
}
