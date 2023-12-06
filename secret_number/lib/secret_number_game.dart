import 'dart:math';
import 'package:flutter/material.dart';

class SecretNumberGame extends StatefulWidget {
  @override
  _SecretNumberGameState createState() => _SecretNumberGameState();
}

class _SecretNumberGameState extends State<SecretNumberGame> {
  final controller = TextEditingController();
  final random = Random();
  late int randomNumber;
  String message = "Choose a number between 1 and 100.";
  int attempts = 0;
  List<int> previousNumbers = [];

  _SecretNumberGameState() {
    randomNumber = random.nextInt(101);
  }

  void verifyGuess() {
  setState(() {
    try {
      int userGuess = int.parse(controller.text);
      attempts++;

      if (userGuess == randomNumber) {
        message = "Parabéns! Você acertou em $attempts tentativas.";
      } else if (userGuess < randomNumber) {
        message = "Tente um número maior.";
      } else {
        message = "Tente um número menor.";
      }

      previousNumbers.add(userGuess);
    } catch (e) {
      message = "Por favor, insira um número válido.";
    }

    controller.clear();
  });
}

  void resetGame() {
    setState(() {
      randomNumber = random.nextInt(101);
      message = "Choose a number between 1 and 100.";
      attempts = 0;
      previousNumbers.clear();
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 8, 85),
      appBar: AppBar(
        title: Text('Secret Number Game.'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIG.wph.rLNsl1FefYdSUMzg?w=1024&h=1024&rs=1&pid=ImgDetMain'),
            )
          ]),
          Text(
            message,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Text(
                  "Enter your guess.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: Text("Check"),
            onPressed: verifyGuess,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Restart"),
            onPressed: resetGame,
          ),
          SizedBox(height: 20),  
          Text(
            "Previous numbers: $previousNumbers",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}