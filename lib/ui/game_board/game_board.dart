import 'package:flutter/material.dart';
import 'package:sun_flutter_basics/model/game_board_args.dart';

import 'game_board_button.dart';

class GameBoard extends StatefulWidget {
  static String routeName = "GameBoard";

  @override
  State<StatefulWidget> createState() {
    return GameBoardState();
  }
}

class GameBoardState extends State {
  TextStyle playerNameTextStyle =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
        appBar: AppBar(
          title: Text("GameBoard"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${args.player1Name}: $player1Score",
                    style: playerNameTextStyle,
                  ),
                  Text(
                    "${args.player2Name}: $player2Score",
                    style: playerNameTextStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(
                    symbol: board[0],
                    onClick: onButtonClick,
                    index: 0,
                  ),
                  GameBoardButton(
                      symbol: board[1], onClick: onButtonClick, index: 1),
                  GameBoardButton(
                      symbol: board[2], onClick: onButtonClick, index: 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(
                      symbol: board[3], onClick: onButtonClick, index: 3),
                  GameBoardButton(
                      symbol: board[4], onClick: onButtonClick, index: 4),
                  GameBoardButton(
                      symbol: board[5], onClick: onButtonClick, index: 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(
                      symbol: board[6], onClick: onButtonClick, index: 6),
                  GameBoardButton(
                      symbol: board[7], onClick: onButtonClick, index: 7),
                  GameBoardButton(
                      symbol: board[8], onClick: onButtonClick, index: 8),
                ],
              ),
            ),
          ],
        ));
  }

  onButtonClick(int index) {
    if (board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "o" : "x";
    board[index] = symbol;
    counter++;
    if (checkWinner(symbol)) {
      if (symbol == "o")
        player1Score++;
      else
        player2Score++;
      resetBoard();
      return;
    }
    if (counter == 9) {
      resetBoard();
    }
    setState(() {});
  }

  void resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (board[0] == symbol && symbol == board[4] && symbol == board[8]) {
      return true;
    }
    if (board[2] == symbol && symbol == board[4] && symbol == board[6]) {
      return true;
    }

    ///Check winner in columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          symbol == board[i + 3] &&
          symbol == board[i + 6]) {
        return true;
      }
    }

    ///Check winner in rows
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          symbol == board[i + 1] &&
          symbol == board[i + 2]) {
        return true;
      }
    }

    return false;
  }
}
