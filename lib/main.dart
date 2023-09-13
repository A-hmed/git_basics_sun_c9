import 'package:flutter/material.dart';
import 'package:sun_flutter_basics/ui/calculator/calculator.dart';
import 'package:sun_flutter_basics/ui/game_board/game_board.dart';
import 'package:sun_flutter_basics/ui/game_board_splash/game_board_splash.dart';
import 'package:sun_flutter_basics/ui/home/home_screen.dart';

/// Column, Row, Stack
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) {
          return HomeScreen();
        },
        Calculator.routeName: (_) => Calculator(),
        GameBoard.routeName: (_) => GameBoard(),
        GameBoardSplash.routeName: (_) => GameBoardSplash(),
      },
      initialRoute: GameBoardSplash.routeName,
    );
  }
}
