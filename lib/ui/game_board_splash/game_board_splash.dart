import 'package:flutter/material.dart';
import 'package:sun_flutter_basics/model/game_board_args.dart';
import 'package:sun_flutter_basics/ui/game_board/game_board.dart';

class GameBoardSplash extends StatelessWidget {
  static const String routeName = "game_board_splash";
  TextEditingController player1Controller = TextEditingController();
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.all(8),
              child: TextField(
                controller: player1Controller,
                decoration: InputDecoration(labelText: "Player1"),
              )),
          Container(
              margin: EdgeInsets.all(8),
              child: TextField(
                onChanged: (text) {
                  player2 = text;
                },
                decoration: InputDecoration(labelText: "Player2"),
              )),
          Spacer(),
          Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GameBoard.routeName,
                        arguments:
                            GameBoardArgs(player1Controller.text, player2));
                  },
                  child: Text("Start")))
        ],
      ),
    );
  }
}
