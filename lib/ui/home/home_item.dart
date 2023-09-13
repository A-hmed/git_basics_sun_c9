import 'package:flutter/material.dart';

import '../../model/home_item_dm.dart';

class HomeItem extends StatelessWidget {
  HomeItemDM model;
  Color textBackground;

  HomeItem(
      {required this.model, this.textBackground = const Color(0xb3882bbd)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(model.imagePath),
        Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: textBackground,
            child: Text(
              model.title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }
}
