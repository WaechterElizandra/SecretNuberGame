import 'package:flutter/material.dart';
import 'secret_number_game.dart';

void main() {
  runApp(MaterialApp(
    home: SecretNumberGame(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: 24),
      ),
    ),
  ));
}